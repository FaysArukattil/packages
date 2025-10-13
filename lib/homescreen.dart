import 'package:flutter/material.dart';
import 'package:packages/animaton3.dart';
import 'package:packages/contactscreen.dart';
import 'package:packages/dashboard.dart';
import 'package:packages/dashboard1.dart';
import 'package:packages/dashboard2.dart';
import 'package:packages/formscreen.dart';
import 'package:packages/homework.dart';
import 'package:packages/imagepickerscreen.dart';
import 'package:packages/lottiscreen.dart';
import 'package:packages/myalerts.dart';
import 'package:packages/myanimations.dart';
import 'package:packages/mydatatable.dart';
import 'package:packages/my_images.dart';
import 'package:packages/mypicker.dart';
import 'package:packages/mysearch.dart';
import 'package:packages/mystagerred.dart';
import 'package:packages/mytable.dart';
import 'package:packages/myvalidation.dart';
import 'package:packages/ratingscreen.dart';
import 'package:packages/staggered2.dart';
import 'package:packages/staggered3.dart';
import 'package:packages/toastscreen.dart';
import 'package:packages/url_laucher.dart';
import 'package:packages/videoscreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
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
              custombutton(context, text: "Search", screen: Mysearch()),
              custombutton(context, text: "Video", screen: VideoScreen()),
              custombutton(context, text: "Rating", screen: Ratingscreen()),
              custombutton(context, text: "Table", screen: Mytable()),
              custombutton(context, text: "DataTable", screen: Mydatatable()),
              custombutton(context, text: "Image", screen: MyImage()),
              custombutton(
                context,
                text: "ImagePicker",
                screen: ImagePickerScreen(),
              ),
              custombutton(context, text: "Toast", screen: Toastscreen()),
              custombutton(context, text: "contacts", screen: Contactscreen()),
              custombutton(context, text: "My Lotti", screen: Lottiscreen()),
              custombutton(context, text: "Url Launcher", screen: Mylauncher()),
              custombutton(
                context,
                text: "Animations 1",
                screen: Myanimations(),
              ),
              custombutton(context, text: "Animation 3", screen: Animaton3()),
              custombutton(context, text: "Animation 4", screen: Homework()),
            ],
          ),
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
