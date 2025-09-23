import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Mypicker extends StatefulWidget {
  const Mypicker({super.key});

  @override
  State<Mypicker> createState() => _MypickerState();
}

class _MypickerState extends State<Mypicker> {
  TextEditingController datecontroller = TextEditingController();
  TextEditingController timecontroller = TextEditingController();
  DateTime? _selectedDate;
  String? formated;
  Future<void> pickdate() async {
    _selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1998),
      lastDate: DateTime(2100),
    );
    if (_selectedDate != null) {
      formated = DateFormat('EEE, dd/MM/yyyy').format(_selectedDate!);
    }
    setState(() {
      datecontroller.text = formated!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 70),
            TextField(
              onTap: () {
                pickdate();
              },
              readOnly: true,
              controller: datecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Date Picker",
              ),
            ),
            SizedBox(height: 4),
            TextField(
              onTap: () {
                pickdate();
              },
              readOnly: true,
              controller: timecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Time Picker",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
