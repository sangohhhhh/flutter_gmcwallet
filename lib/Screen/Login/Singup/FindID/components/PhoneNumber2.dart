import 'package:flutter/material.dart';

class PhoneNumber2 extends StatelessWidget {
  const PhoneNumber2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          color: Colors.white,
          child: TextFormField(
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 26, vertical: 15),
              hintText: '010',
              hintStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        Text("―"),
        Container(
          width: 80,
          child: TextFormField(
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 21, vertical: 15),
              hintText: '7777',
              hintStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        Text("―"),
        Container(
          width: 80,
          child: TextFormField(
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 21,vertical: 15),
              hintText: '7777',
              hintStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 70,
              height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: [Color(0xffd25a7c), Color(0xfff9cc83)])),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "인증",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
