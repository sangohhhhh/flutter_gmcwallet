import 'package:flutter/material.dart';
import 'package:flutter_gmcwallet/Screen/CoinHome/components/ShapeClipper.dart';
import 'package:flutter_gmcwallet/repository/CoinRepository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CoinReceive extends StatefulWidget {
  const CoinReceive({Key key}) : super(key: key);

  @override
  _CoinReceiveState createState() => _CoinReceiveState();
}

class _CoinReceiveState extends State<CoinReceive> {

  final _coinRepository = CoinRepository();
  String address = "";
  _CoinReceiveState() {
    _getEmail().then((val) => setState(() {
      _coinRepository.getWallet(val.toString()).then((result) =>
          setState(() {
            address = result["address"];
          }));
    }));
  }

  Future<String> _getEmail() async{
    final FlutterSecureStorage storage = FlutterSecureStorage();
    return await storage.read(key: "User");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ClipPath(
          clipper: ShapeClipper2(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffffb473).withOpacity(0.8),
                Color(0xffcc3494),
              ]),
            ),
            height: 140,
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
            height: 140,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.keyboard_backspace,
                            size: 30,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        Text(
                          "받기",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: buildCoin(address),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

Widget buildCoin(String address) {

  final _walletController = TextEditingController();
  _walletController.text = address;

  return Column(children: [
    Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 1),
          child: SvgPicture.asset(
            'assets/images/GMC.svg',
            height: 25,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            "GMC",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
        ),
        Text(
          "(GMC)",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        )
      ],
    ),
    SizedBox(
      height: 15,
    ),
    Text(
      "+ Share your QR code or copy address to rerceive",
      style: TextStyle(fontSize: 15, color: Colors.grey),
    ),
    SizedBox(
      height: 12,
    ),
    Column(
      children: [
        Container(
          child: Center(
            child: QrImage(
              data: 'This is a simple QR code',
              version: QrVersions.auto,
              size: 200,
            ),
          ),
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border(
              top: BorderSide(
                width: 5.0,
                color: Color(0XFFecba24),
              ),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 2)),
            ],
          ),
          height: 230,
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "코인지갑주소",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 2)),
            ],
          ),
          child: TextFormField(
            controller: _walletController,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text(
            "주소복사",
            style: TextStyle(
                color: Color(0XFFecba24), fontWeight: FontWeight.bold),
          ),
          style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              side: BorderSide(color: Color(0XFFecba24))),
        ),
        SizedBox(
          height: 80,
        ),
        ElevatedButton(
            onPressed: () {},
            child: Text(
              "닫기",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                primary: Color(0XFFecba24),
                padding: EdgeInsets.symmetric(
                  horizontal: 150,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)))),
      ],
    ),
  ]);
}
