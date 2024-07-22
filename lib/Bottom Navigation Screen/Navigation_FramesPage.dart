import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import '../util/ContentScreen.dart';

class Navigation_FramesPage extends StatefulWidget {
  const Navigation_FramesPage({super.key});

  @override
  State<Navigation_FramesPage> createState() => _Navigation_FramesPageState();
}

class _Navigation_FramesPageState extends State<Navigation_FramesPage> {
  final List<String> img= [
    "assets/t1.png",
    "assets/testing.png",
    "assets/testing1.png",
  ];
  final List<String> videos = [
    'https://assets.mixkit.co/videos/preview/mixkit-young-mother-with-her-little-daughter-decorating-a-christmas-tree-39745-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-winter-fashion-cold-looking-woman-concept-video-39874-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-womans-feet-splashing-in-the-pool-1261-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Swiper(
              itemBuilder:(BuildContext context, int index) {
                return ContentScreen(
                  src:img[index],
                );
              },
              itemCount:img.length,
              scrollDirection: Axis.vertical,
            ),
          ],
        ),
      ),
    );
  }
}
