import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List App',
      debugShowCheckedModeBanner: false,
      home: const ContactListScreen(),
    );
  }
}

class Contact {
  final String name;
  final String phone;

  Contact({required this.name, required this.phone});
}

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final List<Contact> _contacts = [
    Contact(name: 'Jawad', phone: '01877-777777'),
    Contact(name: 'Ferdous', phone: '01673-777777'),
    Contact(name: 'Hasan', phone: '01745-777777'),
    Contact(name: 'Hasan', phone: '01745-777777'),
    Contact(name: 'Yeasin', phone: '01788-777777'),
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        centerTitle: true,
        backgroundColor: const Color(0xFF607D8B),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Name input
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Phone input
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Add button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // No functionality needed per assignment
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF607D8B),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text('Add'),
              ),
            ),
            const SizedBox(height: 16),

            // Contact list
            Expanded(
              child: ListView.separated(
                itemCount: _contacts.length,
                separatorBuilder: (context, index) => const SizedBox(height: 4),
                itemBuilder: (context, index) {
                  final contact = _contacts[index];
                  return Card(
                    elevation: 1,
                    margin: EdgeInsets.zero,
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xFF9E9E9E),
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text(
                        contact.name,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        contact.phone,
                        style: const TextStyle(color: Colors.black87),
                      ),
                      trailing: Icon(Icons.phone, color: Colors.blue[400]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
