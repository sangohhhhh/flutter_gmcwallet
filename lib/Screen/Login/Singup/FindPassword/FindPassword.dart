import 'package:flutter/material.dart';
import 'package:flutter_gmcwallet/Screen/Login/Singup/FindID/components/ShapeClipper.dart';
import 'package:flutter_gmcwallet/Screen/Login/Singup/FindPassword/FindPasswordCompleted.dart';
import 'package:get/get.dart';

class BuildFindPassword extends StatefulWidget {
  @override
  _BuildFindPasswordState createState() => _BuildFindPasswordState();
}

class _BuildFindPasswordState extends State<BuildFindPassword> {
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
                gradient: LinearGradient(colors: [
                  Color(0xffffb473).withOpacity(0.8),
                  Color(0xffcc3494),
                ]),
              ),
              height: 180,
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
                ]),
              ),
              height: 180 ,
            ),
          ),
          Container(
            height: 180,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      "비밀번호 찾기",
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
                "비밀번호를 잊어버리셨나요?",
                style: TextStyle(fontSize: 23),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "당신의 이메일ID를 입력해주세요.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Container(
                  child: Column(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "이메일ID",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 3,
                        )
                      ]),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          labelText: '이메일을 입력해주세요.',
                          labelStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          border:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ]),
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
                gradient: LinearGradient(colors: [
                  Color(0xffd25a7c),
                  Color(0xfff9cc83),
                ])),
            child: TextButton(
              onPressed: () {
                Get.to(BuildFindPasswordCompleted());
              },
              child: Center(
                child: Text(
                  "비밀번호 초기화",
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
