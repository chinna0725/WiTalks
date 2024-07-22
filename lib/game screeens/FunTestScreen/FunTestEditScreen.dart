import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

class FunTestEditScreen extends StatefulWidget {
  final Map<dynamic,dynamic> imageMap;
  const FunTestEditScreen({super.key, required this.imageMap});

  @override
  State<FunTestEditScreen> createState() => _FunTestEditScreenState();
}

class _FunTestEditScreenState extends State<FunTestEditScreen> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fun Quiz'),
      ),
      body: const Center(child: Text("empty")),
    );
  }
}
