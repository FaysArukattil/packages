import 'package:flutter/material.dart';

class Mydatatable extends StatefulWidget {
  const Mydatatable({super.key});

  @override
  State<Mydatatable> createState() => _MydatatableState();
}

class _MydatatableState extends State<Mydatatable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          DataTable(
            headingRowColor: WidgetStateProperty.all(Colors.blueAccent),
            border: TableBorder.all(),
            columns: [
              DataColumn(label: Text("ID")),
              DataColumn(label: Text("Product Name")),
              DataColumn(label: Text("Amount")),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text("1")),
                  DataCell(Text("Iphone 17")),
                  DataCell(Text("82,900")),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text("2")),
                  DataCell(Text("Iphone 17 Pro")),
                  DataCell(Text("115,900")),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text("3")),
                  DataCell(Text("Iphone 17 Pro Max")),
                  DataCell(Text("155,900")),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
