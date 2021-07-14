import 'package:flutter/material.dart';
import 'package:flutter_gmcwallet/Screen/Login/Singup/FindID/FindIDCompleted.dart';
import 'package:flutter_gmcwallet/Screen/Login/Singup/FindID/components/PhoneNumber2.dart';
import 'package:flutter_gmcwallet/Screen/Login/Singup/FindID/components/ShapeClipper.dart';

import 'package:get/get.dart';

class BuildFindID extends StatefulWidget {
  @override
  _BuildFindIDState createState() => _BuildFindIDState();
}

class _BuildFindIDState extends State<BuildFindID> {
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
            ),
          ),
          Container(
            height: 180,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.keyboard_backspace),
                        color: Colors.white,
                        iconSize: 35,
                        
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    Text(
                      "아이디 찾기",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ]),
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
                  "Ooops!",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "이메일ID를 잊어버리셨나요?",
                style: TextStyle(fontSize: 23),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "당신의 전화번호를 입력해주세요.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PhoneNumber2(),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            labelText: '인증번호를 입력해주세요.',
                            labelStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade500,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade300,
                            focusColor: Colors.grey.shade300,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            errorText: '인증번호가 일치하지 않습니다.',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Your email';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
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
                Get.to(BuildFindIDCompleted());
              },
              child: Center(
                child: Text(
                  "확인",
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
