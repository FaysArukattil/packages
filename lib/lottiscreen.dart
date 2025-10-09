import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Lottiscreen extends StatefulWidget {
  const Lottiscreen({super.key});

  @override
  State<Lottiscreen> createState() => _LottiscreenState();
}

class _LottiscreenState extends State<Lottiscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          children: [
            Lottie.asset(
              height: 100,
              width: 100,
              "assets/json/lottie/delivery service.json",

              fit: BoxFit.contain,
            ),
            Lottie.network(
              height: 100,
              width: 100,
              'https://assets2.lottiefiles.com/packages/lf20_x62chJ.json',
            ),
            CachedNetworkImage(
              height: 100,
              width: 100,

              imageUrl:
                  "https://plus.unsplash.com/premium_photo-1745696027433-e4d4ba68d35f?q=80&w=693&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                  ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(height: 30),
            CachedNetworkImage(
              height: 100,
              width: 100,
              imageUrl:
                  "https://plus.unsplash.com/premium_photo-1745696027433-e4d4ba68d35f?q=80&w=693&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.red,
                      BlendMode.colorBurn,
                    ),
                  ),
                ),
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ],
        ),
      ),
    );
  }
}
