import 'package:flutter/material.dart';

class Mytable extends StatefulWidget {
  const Mytable({super.key});

  @override
  State<Mytable> createState() => _MytableState();
}

class _MytableState extends State<Mytable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder.all(),
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(3),
              2: FlexColumnWidth(3),
            },
            children: [
              TableRow(
                decoration: BoxDecoration(color: Colors.grey),
                children: [
                  TableCell(child: Text("ID")),
                  TableCell(child: Text("Productname")),
                  TableCell(child: Text("Amount")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("1")),
                  TableCell(child: Text("Iphone 17")),
                  TableCell(child: Text("82,900")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("2")),
                  TableCell(child: Text("Iphone 17 Pro ")),
                  TableCell(child: Text("115,000")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("3")),
                  TableCell(child: Text("Iphone 17 Pro Max")),
                  TableCell(child: Text("155,500")),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
