import 'package:flutter/material.dart';

class MyAnimations2 extends StatefulWidget {
  const MyAnimations2({super.key});

  @override
  State<MyAnimations2> createState() => _MyAnimations2State();
}

class _MyAnimations2State extends State<MyAnimations2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Hero(
        tag: "ss",

        child: Image.network(
          // height: 300,
          // width: double.maxFinite,
          fit: BoxFit.contain,
          'https://images.unsplash.com/photo-1760182262039-f9bd6bbe479f?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=687',
        ),
      ),
    );
  }
}
