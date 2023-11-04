import 'package:flutter/material.dart';

enum ClipType {
  bottom,
  top,
}

class MyCustomClipper extends CustomClipper<Path> {
  final ClipType clipType;

  MyCustomClipper({required this.clipType});

  @override
  Path getClip(Size size) {
    final path = Path();

    if (clipType == ClipType.bottom) {
      // Create a bottom clipper
      path.lineTo(0, size.height - 40);
      path.quadraticBezierTo(
        size.width / 2,
        size.height,
        size.width,
        size.height - 40,
      );
      path.lineTo(size.width, 0);
    } else {
      // Create a top clipper (you can adjust the shape as needed)
      path.lineTo(0, size.height);
      path.quadraticBezierTo(
        size.width / 2,
        size.height + 40,
        size.width,
        size.height,
      );
      path.lineTo(size.width, 0);
    }

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
