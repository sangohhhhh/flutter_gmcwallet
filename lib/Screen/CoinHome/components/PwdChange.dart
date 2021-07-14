import 'package:flutter/material.dart';
import 'package:flutter_gmcwallet/Screen/Login/Singup/FindID/components/ShapeClipper.dart';
import 'package:flutter_gmcwallet/Screen/Login/loginScreen.dart';
import 'package:get/get.dart';

class PwdChange extends StatefulWidget {
  const PwdChange({Key key}) : super(key: key);

  @override
  _PwdChangeState createState() => _PwdChangeState();
}

class _PwdChangeState extends State<PwdChange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        Stack(children: [
          ClipPath(
            clipper: ShapeClipper2(),
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xffffb473), Color(0xffcc3494)])),
            ),
          ),
          Container(
            child: ClipPath(
              clipper: ShapeClipper1(),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xffd25a7c), Color(0xfff9cc83)])),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: Center(
                    child: Text(
                      "비밀번호 변경",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: changedBox(),
        ),
        SizedBox(
          height: 90,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: [Color(0xffd25a7c), Color(0xfff9cc83)]),
            ),
            child: TextButton(
              onPressed: () {
                Get.to(LoginScreen());
              },
              child: Center(
                child: Text(
                  "변경 완료",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

Widget changedBox() {
  return Container(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "현재 비밀번호",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 9,
              offset: Offset(0, 2),
            )
          ]),
          child: TextFormField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(0.1),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "새로운 비밀번호",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 9,
              offset: Offset(0, 2),
            )
          ]),
          child: TextFormField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(0.1),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "새로운 비밀번호 재확인",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 9,
              offset: Offset(0, 2),
            )
          ]),
          child: TextFormField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(0.1),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
