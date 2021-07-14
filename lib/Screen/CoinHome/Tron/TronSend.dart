import 'package:flutter/material.dart';
import 'package:flutter_gmcwallet/Screen/CoinHome/CoinCompletion.dart';
import 'package:flutter_gmcwallet/Screen/CoinHome/components/ShapeClipper.dart';
import 'package:flutter_gmcwallet/Screen/Login/loginScreen.dart';
import 'package:flutter_gmcwallet/repository/CoinRepository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TronSend extends StatefulWidget {
  const TronSend({Key key}) : super(key: key);

  @override
  _TronSendState createState() => _TronSendState();
}

class _TronSendState extends State<TronSend> {

  final _coinRepository = CoinRepository();
  String email = "";
  String tronBalance = "";
  String gmcBalance = "";
  String tronDollar = "";
  String gmcDollar = "";
  String tronKrw = "";
  String gmcKrw = "";
  _TronSendState() {
    _getEmail().then((val) =>
        setState(() {
          if (val == null) {
            Get.to(LoginScreen());
          } else {
            email = val.toString();
            _coinRepository.getBalance(email).then((result) =>
                setState(() {
                  tronBalance = result["tronBalance"];
                  gmcBalance = result["gmcBalance"];
                  tronDollar = result["tronDollar"];
                  gmcDollar = result["gmcDollar"];
                  tronKrw = result["tronKrw"];
                  gmcKrw = result["gmcKrw"];
                }));
          }
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
                child: Column(children: [
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
                        "보내기(TRON)",
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
                    child: buildTron2(tronBalance, email, context),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

Widget buildTron2(String tronBalance, String email, BuildContext context) {

  final _coinRepository = CoinRepository();
  final _toAddressController = TextEditingController();
  final _amountController = TextEditingController();
  _onSendButtonPressed() async {
    String _toAddr = _toAddressController.text;
    double _amount = double.parse(_amountController.text);
    bool isSend = await _coinRepository.sendTransaction(email, _toAddr, _amount);
    if(isSend == true) {
      Get.to(CoinCompletion());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
        content: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("전송에 실패했습니다.", style: TextStyle(fontSize: 18))
        ]),
        backgroundColor: Colors.red,
      ));
    }
  }

  return Column(children: [
    Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: SvgPicture.asset(
            'assets/images/tronlogo.svg',
            color: Colors.red,
            height: 25,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            "TRON",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
        ),
        Text(
          "(TRX)",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        )
      ],
    ),
    SizedBox(
      height: 0,
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Exchange Price",
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
        ],
      ),
    ),
    SizedBox(
      height: 12,
    ),
    Column(
      children: [
        Container(
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border(
              top: BorderSide(
                width: 5.0,
                color: Color(0XFFff7575),
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
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset(
                    "assets/images/tronlogo.svg",
                    color: Colors.red,
                    height: 50,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "YOUR TRON COIN BALANCE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          tronBalance,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "TRX",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 180,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(
                      "9,999",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "KRW",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "To",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 400,
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
            controller: _toAddressController,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              labelText: "TRON(TRX) 코인 주소를 넣어주세요.",
              labelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ),
        Container(
          width: 400,
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
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              labelText: "TRON(TRX) 코인 수량을 넣어주세요.",
              labelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
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
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/qr-code.svg",
              color: Colors.grey,
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'OR SCAN QR CODE',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 75,
        ),
        ElevatedButton(
          onPressed: () {
            _onSendButtonPressed();
            //Get.to(CoinCompletion());
          },
          child: Text(
            "보내기",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            primary: Color(0XFFff7575),
            padding: EdgeInsets.symmetric(
              horizontal: 140,
              vertical: 15,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          ),
        ),
      ],
    ),
  ]);
}
