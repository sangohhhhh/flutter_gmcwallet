
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gmcwallet/Screen/Login/loginScreen.dart';
import 'package:flutter_gmcwallet/Screen/components/ShapeClipper.dart';

import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; 
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: ShapeClipper3(),
                    child: Container(
                      decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xfff9cc83).withOpacity(0.9),
                  Color(0xffe191a8),
                ]),
              ),
                      height: size.height*1.1,
                    ),
                  ),
                  ClipPath(
                    clipper: ShapeClipper2(),
                    child: Container(
                      decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xffffb473).withOpacity(0.8),
                  Color(0xffcc3494),
                ]),
              ),
                      height: size.height*1.1,
                    ),
                  ),
                  ClipPath(
                    clipper: ShapeClipper1(),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            Color(0xffd25a7c),
                            Color(0xfff9cc83),
                          ])),
                      height: size.height* 1.1,
                    ),
                  ),
                  Container(
                    height: 450,
                    width: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "GMC",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Wallet",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 760,
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "V0.1",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 900,
                      width: 500,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(LoginScreen());
                        },
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );

// body: Stack(
//   children: <Widget>[
//     ClipPath(//       clipper: ShapeClipper(),
//     child: Container(height: 650, color: Color(0xfff8b094)),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Expanded(
//                   child: Container(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           "GMC",
//                           style: TextStyle(
//                             fontSize: 50,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Text(
//                           "Wallet",
//                           style: TextStyle(
//                               fontSize: 25,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: Container(
//                     color: Colors.white,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           "VO.1",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 17,
//                             fontWeight: FontWeight.bold,
  }
}
