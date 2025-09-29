// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';

class Mysearch extends StatefulWidget {
  const Mysearch({super.key});

  @override
  State<Mysearch> createState() => _MysearchState();
}

class _MysearchState extends State<Mysearch> {
  List<String> namescopy = [];
  List<String> names = [
    "Fays",
    "Amar",
    "Devika",
    "Abin",
    "Sreejith",
    "Prasanth",
    "Fays",
    "Amar",
    "Devika",
    "Abin",
    "Sreejith",
    "Prasanth",
    "Fays",
    "Amar",
    "Devika",
    "Abin",
    "Sreejith",
    "Prasanth",
    "Amar",
    "Devika",
    "Abin",
    "Sreejith",
    "Prasanth",
    "Fays",
    "Amar",
    "Devika",
    "Abin",
    "Sreejith",
    "Prasanth",
    "Amar",
    "Devika",
    "Abin",
    "Sreejith",
    "Prasanth",
    "Fays",
    "Amar",
    "Devika",
    "Abin",
    "Sreejith",
    "Prasanth",
  ];
  void search(String input) {
    namescopy.clear();
    namescopy = names.where((element) {
      return element.toLowerCase().contains(input.toLowerCase().trim());
    }).toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    namescopy.addAll(names);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            SearchBar(
              hintText: "Search your Contacts",
              onChanged: (value) {
                search(value);
              },
            ),
            ListView.separated(
              padding: EdgeInsets.all(16),
              itemCount: namescopy.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  // ignore: duplicate_ignore
                  // ignore: unnecessary_string_interpolations
                  title: Text("${namescopy[index]}"),
                  leading: CircleAvatar(child: Text("${namescopy[index][0]}")),
                  trailing: Icon(Icons.call),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ],
        ),
      ),
    );
  }
}
