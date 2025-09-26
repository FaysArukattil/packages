import 'package:flutter/material.dart';
import 'package:packages/callscreen.dart';
import 'package:packages/chatscreen.dart';
import 'package:packages/communityscreen.dart';
import 'package:packages/updatescreen.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

class Dashboard1 extends StatefulWidget {
  const Dashboard1({super.key});

  @override
  State<Dashboard1> createState() => _Dashboard1State();
}

class _Dashboard1State extends State<Dashboard1> {
  int index = 0;
  List<Widget> screens = [
    Chatscreen(),
    UpdateScreen(),
    Communityscreen(),
    Callscreen(),
  ];
  List<Color> color = [
    Colors.blue,
    Colors.deepPurple,
    Colors.amber,
    Colors.green,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (value) {
          index = value;
          setState(() {});
        },

        index: index,
        backgroundColor: color[index],
        color: Colors.white,

        items: [
          CurvedNavigationBarItem(child: Icon(Icons.chat), label: "Chats"),
          CurvedNavigationBarItem(child: Icon(Icons.update), label: "Updates"),
          CurvedNavigationBarItem(
            child: Icon(Icons.people),
            label: "community",
          ),
          CurvedNavigationBarItem(child: Icon(Icons.call), label: "Calls"),
        ],
      ),
    );
  }
}
