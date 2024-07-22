import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path>{

  @override
  getClip(Size size) {
    Path path= Path();
    path.lineTo(0, size.height*0.7);
    path.lineTo(size.width/2, size.height);
    path.lineTo(size.width, size.height*0.7);
    path.lineTo(size.width, 0);
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}