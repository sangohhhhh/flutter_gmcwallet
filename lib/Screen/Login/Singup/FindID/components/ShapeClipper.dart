import 'package:flutter/material.dart';

class ShapeClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.quadraticBezierTo(0, size.height * 0.6, 0, size.height * 0.7);
    path.cubicTo(size.width * 0.5, size.height, size.width * 0.6,
        size.height * 0.4, size.width, size.height * 0.6);
    path.quadraticBezierTo(size.width, size.height * 0.6, size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}

class ShapeClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.quadraticBezierTo(0, size.height * 0.6, 0, size.height * 0.7);
    path.cubicTo(size.width * 0.5, size.height * 1.07, size.width * 0.7,
        size.height * 0.7, size.width, size.height * 0.6);
    path.quadraticBezierTo(size.width, size.height * 0.6, size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}

class ShapeClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.5, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.95, size.width, size.height * 0.75);
    path.quadraticBezierTo(size.width, size.height * 0.6, size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
