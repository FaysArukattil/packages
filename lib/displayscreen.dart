import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String dob;
  final String country;
  final String gender;
  final List<String> languages;

  const DisplayScreen({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.dob,
    required this.country,
    required this.gender,
    required this.languages,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: $name"),
            Text("Email: $email"),
            Text("Phone: $phone"),
            Text("DOB: $dob"),
            Text("Country: $country"),
            Text("Gender: $gender"),
            Text("Languages: $languages"),
          ],
        ),
      ),
    );
  }
}
