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
  TimeOfDay? _selectedTime;

  // Date Picker
  Future<void> pickdate() async {
    _selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1998),
      lastDate: DateTime(2100),
    );

    if (_selectedDate != null) {
      formated = DateFormat('EEE, dd/MM/yyyy').format(_selectedDate!);
      setState(() {
        datecontroller.text = formated!;
      });
    }
  }

  // Time Picker (24-hour format) with AM/PM display
  Future<void> picktime() async {
    _selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (_selectedTime != null) {
      final now = DateTime.now();
      final selectedDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        _selectedTime!.hour,
        _selectedTime!.minute,
      );

      String formatted24h = DateFormat('HH:mm').format(selectedDateTime);
      String formattedAmPm = DateFormat('hh:mm a').format(selectedDateTime);

      setState(() {
        timecontroller.text = "$formatted24h ($formattedAmPm)";
      });
    }
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
              onTap: pickdate,
              readOnly: true,
              controller: datecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Date Picker",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              onTap: picktime,
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
