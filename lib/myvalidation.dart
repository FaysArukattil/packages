import 'package:flutter/material.dart';

class Myvalidation extends StatefulWidget {
  const Myvalidation({super.key});

  @override
  State<Myvalidation> createState() => _MyvalidationState();
}

class _MyvalidationState extends State<Myvalidation> {
  final formkey = GlobalKey<FormState>();
  TextEditingController passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Form(
              key: formkey,
              child: TextFormField(
                controller: passcontroller,
                validator: (value) => validatepass(value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                  label: Text("Password"),
                ),
                obscureText: true,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  Navigator.pop(context);
                }
              },
              child: Text("submit"),
            ),
          ],
        ),
      ),
    );
  }

  validatepass(String? value) {
    RegExp capital = RegExp(r'^(?=.*[A-Z]).+$');
    RegExp small = RegExp(r'^(?=.*[a-z]).+$');
    RegExp numbers = RegExp(r'^(?=.*[0-9]).+$');
    RegExp special = RegExp(r'^(?=.*[*#@%.,]).+$');

    if (value!.isEmpty) {
      return "Please Enter a Password";
    } else if (value.length < 8) {
      return "A minimun of 8 Characters are required";
    } else if (!capital.hasMatch(value)) {
      return "Atleast one Capital letter is required";
    } else if (!small.hasMatch(value)) {
      return "Atleast one small letter is required";
    } else if (!numbers.hasMatch(value)) {
      return "Atleast one number is required";
    } else if (!special.hasMatch(value)) {
      return "Atleast one Special Character is  is required";
    } else {
      return null;
    }
  }
}
