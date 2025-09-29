import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final List<String> videoUrls = [
    "assets/videos/Video1.mp4",
    "assets/videos/video2.mp4",
    "assets/videos/video3.mp4",
  ];

  late List<VideoPlayerController> controllers;
  int currentPage = 0;
  bool _showIcon = false;

  @override
  void initState() {
    super.initState();

    // Initialize controllers
    controllers = videoUrls.map((url) {
      final controller = VideoPlayerController.asset(url)
        ..initialize().then((_) {
          setState(() {});
        })
        ..setLooping(true);
      return controller;
    }).toList();

    // Play first video
    controllers[0].initialize().then((_) {
      setState(() {});
      controllers[0].play();
    });
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _togglePlayPause() {
    final controller = controllers[currentPage];
    setState(() {
      if (controller.value.isPlaying) {
        controller.pause();
      } else {
        controller.play();
      }
      _showIcon = true;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _showIcon = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: controllers.length,
        onPageChanged: (index) {
          // Pause previous video
          controllers[currentPage].pause();
          // Play new video
          controllers[index].initialize().then(
            (_) => controllers[index].play(),
          );
          currentPage = index;
        },
        itemBuilder: (context, index) {
          final controller = controllers[index];
          return controller.value.isInitialized
              ? GestureDetector(
                  onTap: _togglePlayPause,
                  child: Stack(
                    children: [
                      SizedBox.expand(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: controller.value.size.width,
                            height: controller.value.size.height,
                            child: VideoPlayer(controller),
                          ),
                        ),
                      ),
                      if (_showIcon)
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black45,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(20),
                            child: Icon(
                              controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
        },
      ),
    );
  }
}
