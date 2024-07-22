import 'package:flutter/material.dart';

import '../EditingScreen.dart';

class OptionsScreen extends StatefulWidget {
  final image;
  const OptionsScreen({super.key, required this.image});

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}
class _OptionsScreenState extends State<OptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.favorite_outline),
                      const Text('601k'),
                      const SizedBox(height: 20),
                      const Icon(Icons.comment_rounded),
                      const Text('1123'),
                      const SizedBox(height: 20),
                      Transform(
                        transform: Matrix4.rotationZ(5.8),
                        child: const Icon(Icons.send),
                      ),
                      const SizedBox(height: 50),
                      const Icon(Icons.more_vert),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditingScreen(image:widget.image),));
                  },
                      style: OutlinedButton.styleFrom(
                          shape:const RoundedRectangleBorder(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(5),
                                  right: Radius.circular(5))
                          )
                      ),
                      child:const Text("Create Image")),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}