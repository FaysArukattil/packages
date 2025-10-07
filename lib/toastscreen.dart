import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toastscreen extends StatefulWidget {
  const Toastscreen({super.key});

  @override
  State<Toastscreen> createState() => _ToastscreenState();
}

class _ToastscreenState extends State<Toastscreen> {
  late FToast fToast;
  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  void showToast(String msg) {
    fToast.showToast(
      toastDuration: Duration(seconds: 3),
      fadeDuration: Duration(seconds: 2),

      gravity: ToastGravity.CENTER,
      child: Container(
        height: 30,
        width: 500,
        decoration: BoxDecoration(
          color: Colors.blueAccent.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: Text(msg)),
      ),
    );
  }

  void showToast2(String msg) {
    fToast.showToast(
      toastDuration: Duration(seconds: 3),
      fadeDuration: Duration(seconds: 2),
      positionedToastBuilder: (context, child, gravity) {
        return Positioned(bottom: 60, right: 20, child: child);
      },
      child: Container(
        height: 30,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.blueAccent.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: Text(msg)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                showToast("This is a Toast");
              },
              child: Text("Toast Button"),
            ),
            ElevatedButton(
              onPressed: () {
                showToast2("This is a positioned Toast");
              },
              child: Text("Positioned Toast"),
            ),
          ],
        ),
      ),
    );
  }
}
