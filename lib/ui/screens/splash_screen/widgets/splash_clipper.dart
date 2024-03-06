import 'package:flutter/material.dart';

class SplashClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, size.height - 20)
      ..cubicTo(size.width * 0.45, size.height, size.width * 0.45,
          size.height - 120, size.width, size.height - 110)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
