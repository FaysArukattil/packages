import 'package:flutter/material.dart';
import 'package:packages/my_animations2.dart';

class Myanimations extends StatefulWidget {
  const Myanimations({super.key});

  @override
  State<Myanimations> createState() => _MyanimationsState();
}

class _MyanimationsState extends State<Myanimations>
    with TickerProviderStateMixin {
  double opacity = 1;
  Size size = Size(100, 100);

  void togglesize() {
    setState(() {
      size = (size.height == 100) ? Size(200, 200) : Size(100, 100);
    });
  }

  void toggleopacity() {
    setState(() {
      opacity = (opacity == 1) ? 0 : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        MyAnimations2(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                          // return ScaleTransition(
                          //   scale: Tween(begin: 0.9, end: 1.0).animate(
                          //     CurvedAnimation(
                          //       parent: animation,
                          //       curve: Curves.linear,
                          //     ),
                          //   ),
                          //   child: child,
                          // );
                        },
                  ),
                );
              },
              child: Hero(
                tag: "ss",

                child: Image.network(
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                  'https://images.unsplash.com/photo-1760182262039-f9bd6bbe479f?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=687',
                ),
              ),
            ),
            SizedBox(height: 60),
            InkWell(
              onTap: () {
                togglesize();
              },
              child: AnimatedSize(
                reverseDuration: Duration(seconds: 2),
                duration: Duration(seconds: 2),
                child: Image.network(
                  height: size.height,
                  width: size.width,
                  fit: BoxFit.contain,
                  'https://images.unsplash.com/photo-1760182262039-f9bd6bbe479f?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=687',
                ),
              ),
            ),
            SizedBox(height: 60),
            InkWell(
              onTap: () {
                toggleopacity();
              },
              child: AnimatedOpacity(
                opacity: opacity,
                duration: Duration(seconds: 2),
                child: Image.network(
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                  'https://images.unsplash.com/photo-1760182262039-f9bd6bbe479f?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=687',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
