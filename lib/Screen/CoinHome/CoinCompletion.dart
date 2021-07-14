import 'package:flutter/material.dart';

import 'package:flutter_gmcwallet/Screen/Login/ShapeClipper.dart';
import 'package:get/get.dart';

import 'CoinHome.dart';

class CoinCompletion extends StatefulWidget {
  const CoinCompletion({Key key}) : super(key: key);

  @override
  _CoinCompletionState createState() => _CoinCompletionState();
}

class _CoinCompletionState extends State<CoinCompletion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: <Widget>[
        Container(
          height: 290,
          child: Stack(children: <Widget>[
            ClipPath(
              clipper: ShapeClipper3(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xfff9cc83).withOpacity(0.9),
                    Color(0xffe191a8),
                  ]),
                ),
                height: 700,
              ),
            ),
            ClipPath(
              clipper: ShapeClipper2(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xffffb473).withOpacity(0.8),
                    Color(0xffcc3494).withOpacity(0.8),
                  ]),
                ),
                height: 700,
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
                height: 700,
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          height: 350,
          // color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "코인전송이 완료되었습니다.",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
    
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    colors: [Color(0xffd25a7c), Color(0xfff9cc83)])),
            child: TextButton(
              onPressed: () {
                Get.to(CoinHome());
              },
              child: Center(
                child: Text(
                  "메인으로 가기",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
