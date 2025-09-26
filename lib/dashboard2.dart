import 'package:flutter/material.dart';
import 'package:packages/callscreen.dart';
import 'package:packages/chatscreen.dart';
import 'package:packages/communityscreen.dart';
import 'package:packages/updatescreen.dart';
import 'package:convex_bottom_bar_renew/convex_bottom_bar_renew.dart';

class Dashboard2 extends StatefulWidget {
  const Dashboard2({super.key});

  @override
  State<Dashboard2> createState() => _Dashboard2State();
}

class _Dashboard2State extends State<Dashboard2> {
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
      body: screens[index],
      appBar: AppBar(backgroundColor: color[index]),
      bottomNavigationBar: ConvexAppBar(
        color: Colors.white,
        backgroundColor: Colors.black,
        activeColor: color[index],
        items: [
          TabItem(icon: Icons.chat, title: "Chats"),
          TabItem(icon: Icons.update, title: 'Updates'),
          TabItem(icon: Icons.person, title: 'Community'),
          TabItem(icon: Icons.call, title: 'calls'),
        ],
        onTap: (int i) {
          index = i;
          setState(() {});
        },
      ),
    );
  }
}
