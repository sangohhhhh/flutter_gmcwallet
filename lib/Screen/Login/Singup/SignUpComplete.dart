import 'package:flutter/material.dart';
import 'package:flutter_gmcwallet/Screen/Login/ShapeClipper.dart';
import 'package:flutter_gmcwallet/Screen/Login/loginScreen.dart';
import 'package:flutter_gmcwallet/common/data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get/get.dart';

class SingUpComplated extends StatefulWidget {
  @override
  _SingUpComplatedState createState() => _SingUpComplatedState();

}

class _SingUpComplatedState extends State<SingUpComplated> {

  // final Data data;
  // _SingUpComplatedState({this.data});

  String email = "";

  _SingUpComplatedState() {
    _getEmail().then((val) => setState(() {
      email = val.toString();
    }));
  }

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
                    Color(0xffcc3494),
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
          height: 10,
        ),
        Container(
          height: 350,
          // color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "회원가입이 완료되었습니다.",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                email + " 이메일을 인증하신 후",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                "로그인하시기 바랍니다.",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
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

  Future<String> _getEmail() async{
    final FlutterSecureStorage storage = FlutterSecureStorage();
    return await storage.read(key: "User");
  }
}
