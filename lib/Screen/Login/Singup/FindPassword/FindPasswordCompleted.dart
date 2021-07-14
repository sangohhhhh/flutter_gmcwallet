import 'package:flutter/material.dart';
import 'package:flutter_gmcwallet/Screen/Login/Singup/FindID/components/ShapeClipper.dart';
import 'package:flutter_gmcwallet/Screen/Login/loginScreen.dart';

import 'package:get/get.dart';

class BuildFindPasswordCompleted extends StatefulWidget {
  @override
  _BuildFindPasswordCompletedState createState() =>
      _BuildFindPasswordCompletedState();
}

class _BuildFindPasswordCompletedState
    extends State<BuildFindPasswordCompleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: <Widget>[
        Stack(children: <Widget>[
          ClipPath(
            clipper: ShapeClipper2(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xffffb473), Color(0xffcc3494)]),
              ),
              height: 180,
            ),
          ),
          ClipPath(
            clipper: ShapeClipper1(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    colors: [Color(0xffd25a7c), Color(0xfff9cc83)]),
              ),
              height: 180,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Center(
                  child: Text(
                    "비밀번호 찾기",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ]),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 480,
          // color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "초기화된 비밀번호가",
                  style: TextStyle(fontSize: 23),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "XXX@XXX.com 으로 전송되었습니다.",
                style: TextStyle(fontSize: 21),
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
                Get.to(LoginScreen());
              },
              child: Center(
                child: Text(
                  "로그인으로 가기",
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
