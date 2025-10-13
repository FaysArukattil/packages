import 'package:flutter/material.dart';

class Homework extends StatefulWidget {
  const Homework({super.key});

  @override
  State<Homework> createState() => _HomeworkState();
}

class _HomeworkState extends State<Homework>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeanimation;
  Size size = const Size(100, 100);
  Color color = Colors.blue;

  void changeColorandSize() {
    setState(() {
      size = (size.height == 100) ? const Size(350, 350) : const Size(100, 100);
      color = color == Colors.blue ? Colors.amber : Colors.blue;
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _sizeanimation = Tween<double>(begin: 1, end: 350).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // prevents column expansion jitter
            children: [
              const SizedBox(height: 60),
              InkWell(
                onTap: changeColorandSize,
                child: AnimatedContainer(
                  decoration: BoxDecoration(color: color),
                  curve: Curves.decelerate,
                  width: size.width,
                  height: size.height,
                  duration: const Duration(seconds: 2),
                  child: const Center(child: Text("Hello")),
                ),
              ),
              const SizedBox(height: 20),
              AnimatedBuilder(
                animation: _sizeanimation,
                builder: (context, child) {
                  return SizedBox(
                    height: 400,
                    width: 400,
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.network(
                        'https://images.unsplash.com/photo-1760182262039-f9bd6bbe479f?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=687',
                        height: _sizeanimation.value,
                        width: _sizeanimation.value,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
