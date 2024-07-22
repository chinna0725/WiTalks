import 'package:flutter/material.dart';
import 'package:witalks/game%20screeens/NameTest/CalculatorWidget.dart';
import 'package:witalks/game%20screeens/NameTest/NameMeaningWidget.dart';

class PlayNameTestScreen extends StatefulWidget {
  final imageMap;

  const PlayNameTestScreen({super.key, required this.imageMap});

  @override
  State<PlayNameTestScreen> createState() => _PlayNameTestScreenState();
}

class _PlayNameTestScreenState extends State<PlayNameTestScreen> {
  @override
  Widget build(BuildContext context) {
   // final size= MediaQuery.of(context).size;
    return CalculatorWidget(imageMap: widget.imageMap);
  }
}
