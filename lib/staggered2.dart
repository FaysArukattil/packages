import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Staggered2 extends StatefulWidget {
  const Staggered2({super.key});

  @override
  State<Staggered2> createState() => _Staggered2State();
}

class _Staggered2State extends State<Staggered2> {
  List<String> images = [
    'https://images.unsplash.com/photo-1744360818432-49bd49d9162b?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1734375906855-f3719d0f252f?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1731462383254-38e49c6350ae?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1720824237728-e5f64b3c19f7?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1656918930259-709cbc0624cd?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1605559424843-9e4c228bf1c2?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: images.length,

        itemBuilder: (context, index) {
          return Tile(
            index: index,
            extent: (index % 5 + 1) * 100,
            url: images[index],
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class Tile extends StatelessWidget {
  int index;
  String url;
  double extent;
  Tile({
    super.key,
    required this.index,
    required this.extent,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: extent,
      child: Image.network(url, fit: BoxFit.cover),
    );
  }
}
