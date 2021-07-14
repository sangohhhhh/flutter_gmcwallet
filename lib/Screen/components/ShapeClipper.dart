import 'package:flutter/material.dart';

class ShapeClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
       Path path = Path();
 path.quadraticBezierTo(0, size.height * 0.6, 0, size.height * 0.7);
    path.cubicTo(size.width * 0.5, size.height / 1.25, size.width * 0.55,
        size.height/1.7, size.width, size.height * 0.66);
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
    path.cubicTo(size.width * 0.5, size.height * 0.82, size.width * 0.6,
        size.height * 0.7, size.width, size.height * 0.66);
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
    path.lineTo(size.width * 0.45, size.height * 0.7);
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.78, size.width, size.height * 0.71);
    path.quadraticBezierTo(size.width, size.height * 0.6, size.width, 0);
    return path;
}
  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
































  //   final Path path = Path();
  //   path.lineTo(0.5,size. width + 50);

  //   var firstControlPoint = Offset(size.width * 0.25, size.height - 50.0);
  //   var firstEndPoint = Offset(size.width *0.5, size.height - 35.0);
  //   path.quadraticBezierTo(firstControlPoint.dx,firstControlPoint.dy,firstEndPoint.dx,firstEndPoint.dy);

  //   var SecondControlPoint = Offset(size.width * .75, size.height - 10);
  //   var SecondEndPoint = Offset(size.width , size.height - 80.0);
  //   path.quadraticBezierTo(SecondControlPoint.dx,SecondControlPoint.dy,SecondEndPoint.dx,SecondEndPoint.dy);
    
    
  //   path.lineTo(size.width, 0.0);
  //   path.close();
  // return path;