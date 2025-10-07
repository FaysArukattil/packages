import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imagepickerscreen extends StatefulWidget {
  const Imagepickerscreen({super.key});

  @override
  State<Imagepickerscreen> createState() => _ImagepickerscreenState();
}

class _ImagepickerscreenState extends State<Imagepickerscreen> {
  ImagePicker imagePicker = ImagePicker();
  File? pickedImage1;
  File? pickedImage2;
  Future<void> pick() async {
    var data1 = await imagePicker.pickImage(source: ImageSource.camera);

    if (data1 != null) {
      setState(() {
        pickedImage1 = File(data1.path);
      });
    }
  }

  Future<void> pick2() async {
    var data2 = await imagePicker.pickImage(source: ImageSource.gallery);

    if (data2 != null) {
      setState(() {
        pickedImage2 = File(data2.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            InkWell(
              child: SizedBox(
                height: 300,
                width: 300,
                child: pickedImage1 == null
                    ? Icon(Icons.camera_alt, size: 100)
                    : Image.file(File(pickedImage1!.path)),
              ),
              onTap: () {
                pick();
              },
            ),
            InkWell(
              child: SizedBox(
                height: 300,
                width: 300,
                child: pickedImage2 == null
                    ? Icon(Icons.image, size: 100)
                    : Image.file(File(pickedImage2!.path)),
              ),
              onTap: () {
                pick2();
              },
            ),
          ],
        ),
      ),
    );
  }
}
