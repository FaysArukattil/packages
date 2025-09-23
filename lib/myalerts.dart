import 'package:flutter/material.dart';

class Myalerts extends StatefulWidget {
  const Myalerts({super.key});

  @override
  State<Myalerts> createState() => _MyalertsState();
}

class _MyalertsState extends State<Myalerts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                _showDialogue(context);
              },
              child: Text("Form"),
            ),
            ElevatedButton(
              onPressed: () {
                _showDialogue1(context);
              },
              child: Text("Button"),
            ),
            ElevatedButton(
              onPressed: () async {
                ConfirmAction? result = await confirmDialogue(context);
                // ignore: avoid_print
                print(result!.name);
              },
              child: Text("ConfirmAlert"),
            ),
            ElevatedButton(
              onPressed: () async {
                Brand? result = await _optionAlert(context);
                // ignore: avoid_print
                print(result);
              },
              child: Text("Button"),
            ),
          ],
        ),
      ),
    );
  }

  _showDialogue1(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("This a Dialogue"),
          content: Text("Are you sure you want to Exit"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Yes"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("No"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  _showDialogue(BuildContext context) {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();

    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("This a Dialogue"),
          content: SizedBox(
            height: 300,
            child: Column(
              children: [
                TextField(controller: namecontroller),
                TextField(controller: passwordcontroller),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  Future<ConfirmAction?> confirmDialogue(BuildContext context) {
    return showDialog<ConfirmAction>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Are you sure you want to Exit"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(ConfirmAction.accept),
              child: Text("Yes"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(ConfirmAction.reject),
              child: Text("No"),
            ),
          ],
        );
      },
    );
  }
}

Future<Brand?> _optionAlert(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: Text("Select a Brand"),
        children: [
          SimpleDialogOption(
            onPressed: () {
              Navigator.of(context).pop(Brand.apple);
            },
            child: Text(Brand.apple.name),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.of(context).pop(Brand.vivo);
            },
            child: Text(Brand.vivo.name),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.of(context).pop(Brand.oppo);
            },
            child: Text(Brand.oppo.name),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.of(context).pop(Brand.samsung);
            },
            child: Text(Brand.samsung.name),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.of(context).pop(Brand.iqoo);
            },
            child: Text(Brand.iqoo.name),
          ),
        ],
      );
    },
  );
}

enum ConfirmAction { reject, accept }

enum Brand { apple, vivo, oppo, samsung, iqoo }
