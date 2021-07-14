import 'package:flutter/material.dart';

class ShapeClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
       Path path = Path();
 path.quadraticBezierTo(0, size.height * 0.3, 0, size.height * 0.3);
    path.cubicTo(size.width * 0.5, size.height *0.85, size.width * 0.5,
        size.height*0.01, size.width, size.height * 0.3);
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
    path.quadraticBezierTo(0, size.height * 0.3, 0, size.height * 0.3);
    path.cubicTo(size.width * 0.5, size.height * 0.8, size.width * 0.55,
        size.height * 0.55, size.width, size.height * 0.3);
    path.quadraticBezierTo(size.width, size.height * 0.6, size.width, 0);
    return path;
}
  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}


