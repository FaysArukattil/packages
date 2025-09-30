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

class _Dashboard2State extends State<Dashboard2>
    with SingleTickerProviderStateMixin {
  PageController controller = PageController();
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: screens.length, vsync: this);
    controller.addListener(() {
      final newindex = controller.page?.round() ?? 0;
      if (tabController.index != newindex) {
        tabController.animateTo(newindex);
      }
    });
  }

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
      body: PageView.builder(
        itemBuilder: (context, index) {
          return screens[index];
        },
        controller: controller,
        itemCount: screens.length,
        onPageChanged: (value) {
          setState(() {
            index = value;
          });
        },
      ),
      appBar: AppBar(backgroundColor: color[index]),
      bottomNavigationBar: ConvexAppBar(
        controller: tabController,
        initialActiveIndex: index,
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
          controller.animateToPage(
            index,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOutCubic,
          );
        },
      ),
    );
  }
}
