import 'package:flutter/material.dart';
import 'models/contact.dart';
import 'widgets/contact_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      debugShowCheckedModeBanner: false,
      home: const ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  // Controllers to read text field values
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // Sample contacts shown in the list (like the screenshot)
  final List<Contact> _contacts = [
    Contact(name: 'Faisal', phone: '01877-777777'),
    Contact(name: 'Tanvir', phone: '01673-777777'),
    Contact(name: 'Asad', phone: '01745-777777'),
    Contact(name: 'Karim', phone: '01745-777777'),
    Contact(name: 'Ertogul', phone: '01745-777777'),
  ];

  // Called when Add button is pressed
  void _addContact() {
    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();

    if (name.isEmpty || phone.isEmpty) return;

    setState(() {
      _contacts.add(Contact(name: name, phone: phone));
    });

    // Clear fields after adding
    _nameController.clear();
    _phoneController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF4A7A9B), // blue-grey color from screenshot
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Name input field
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Hasan',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            // Phone input field
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: '01745-777777',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            // Add button — full width
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _addContact,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A7A9B),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Contact list — scrollable
            Expanded(
              child: ListView.builder(
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  return ContactTile(contact: _contacts[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}