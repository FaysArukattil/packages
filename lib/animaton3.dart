import 'package:flutter/material.dart';

class Animaton3 extends StatefulWidget {
  const Animaton3({super.key});

  @override
  State<Animaton3> createState() => _Animaton3State();
}

class _Animaton3State extends State<Animaton3>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityanimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _opacityanimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _opacityanimation,
        builder: (context, child) {
          return Opacity(
            opacity: _animationController.value,
            child: Image.network(
              // height: 200,
              // width: 200,
              fit: BoxFit.contain,
              'https://images.unsplash.com/photo-1760182262039-f9bd6bbe479f?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=687',
            ),
          );
        },
      ),
    );
  }
}
