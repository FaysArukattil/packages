import 'package:flutter/material.dart';
import 'package:packages/dashboard.dart';
import 'package:packages/dashboard1.dart';
import 'package:packages/dashboard2.dart';
import 'package:packages/formscreen.dart';
import 'package:packages/myalerts.dart';
import 'package:packages/mypicker.dart';
import 'package:packages/mystagerred.dart';
import 'package:packages/myvalidation.dart';
import 'package:packages/staggered2.dart';
import 'package:packages/staggered3.dart';

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
            custombutton(
              context,
              text: "Password Validation",
              screen: Myvalidation(),
            ),
            custombutton(
              context,
              text: "Staggered Grid View",
              screen: Mystagerred(),
            ),
            custombutton(context, text: "Staggered 2", screen: Staggered2()),
            custombutton(context, text: "Staggered 3", screen: Staggered3()),
            custombutton(context, text: "Dashboard ", screen: Dashboard()),
            custombutton(context, text: "Dashboard 1", screen: Dashboard1()),
            custombutton(context, text: "Dashboard 2", screen: Dashboard2()),
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
