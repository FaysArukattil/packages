import 'package:flutter/material.dart';
import 'package:packages/formscreen.dart';
import 'package:packages/myalerts.dart';
import 'package:packages/mypicker.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            custombutton(context, text: "My Alerts", screen: Myalerts()),
            custombutton(
              context,
              text: "Date & Time Picker",
              screen: Mypicker(),
            ),
            custombutton(context, text: "Form", screen: FormScreen()),
          ],
        ),
      ),
    );
  }

  Widget custombutton(
    BuildContext context, {
    required String text,
    void Function()? onPressed,
    required Widget screen,
  }) {
    return Column(
      children: [
        ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
            ),
            padding: WidgetStateProperty.all(EdgeInsets.all(9)),
            minimumSize: WidgetStateProperty.all(Size(300, 45)),
            backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
            foregroundColor: WidgetStateProperty.all(Colors.white),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            );
          },
          child: Text(text, style: TextStyle(fontSize: 19)),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
