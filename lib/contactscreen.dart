import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class Contactscreen extends StatefulWidget {
  const Contactscreen({super.key});

  @override
  State<Contactscreen> createState() => _ContactscreenState();
}

class _ContactscreenState extends State<Contactscreen> {
  List<Contact>? list;
  bool hasPermission = true;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future<void> fetch() async {
    // Request permission
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() {
        hasPermission = false;
      });
    } else {
      // Get contacts (with display name)
      var contacts = await FlutterContacts.getContacts();
      setState(() {
        list = contacts;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contacts"), centerTitle: true),
      body: body(),
    );
  }

  Widget body() {
    if (list == null) {
      return const Center(child: CircularProgressIndicator());
    } else if (!hasPermission) {
      return const Center(child: Text("No Permission Granted"));
    } else {
      return ListView.builder(
        itemCount: list!.length,
        itemBuilder: (context, index) {
          final contact = list![index];
          return ListTile(
            onTap: () async {
              final fullContact = await FlutterContacts.getContact(contact.id);
              if (fullContact != null) {
                Navigator.push(
                  // ignore: use_build_context_synchronously
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(contact: fullContact),
                  ),
                );
              }
            },
            leading: CircleAvatar(
              child: Text(
                contact.displayName.isNotEmpty ? contact.displayName[0] : '?',
              ),
            ),
            title: Text(contact.displayName),
          );
        },
      );
    }
  }
}

class Details extends StatelessWidget {
  final Contact contact;
  const Details({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    final firstName = contact.name.first.isNotEmpty
        ? contact.name.first
        : "(none)";
    final lastName = contact.name.last.isNotEmpty
        ? contact.name.last
        : "(none)";
    final phone = contact.phones.isNotEmpty
        ? contact.phones.first.number
        : "(none)";
    final email = contact.emails.isNotEmpty
        ? contact.emails.first.address
        : "(none)";

    return Scaffold(
      appBar: AppBar(title: Text(contact.displayName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('First name: $firstName'),
            Text('Last name: $lastName'),
            Text('Phone number: $phone'),
            Text('Email address: $email'),
          ],
        ),
      ),
    );
  }
}
