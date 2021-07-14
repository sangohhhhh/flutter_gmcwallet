import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gmcwallet/Screen/CoinHome/CoinHome.dart';
import 'package:flutter_gmcwallet/Screen/Login/ShapeClipper.dart';
import 'package:flutter_gmcwallet/Screen/Login/Singup/FindID/FindID.dart';
import 'package:flutter_gmcwallet/Screen/Login/Singup/FindPassword/FindPassword.dart';
import 'package:flutter_gmcwallet/Screen/Login/Singup/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gmcwallet/Bloc/login_bloc/LoginBloc.dart';
import 'package:flutter_gmcwallet/Bloc/login_bloc/LoginEvent.dart';
import 'package:flutter_gmcwallet/Bloc/login_bloc/LoginState.dart';
import 'package:flutter_gmcwallet/repository/repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  final Function press;
  final UserRepository userRepository;
  const LoginForm({Key key, this.userRepository, this.press})
      // : assert(userRepository != null),
      : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState(userRepository);
}

class _LoginFormState extends State<LoginForm> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool checkBoxValue = false;
  bool checkBoxValue2 = false;

  String email = "";
  String savedEmail = "";
  _LoginFormState(this.userRepository) {
    _getEmail().then((val) => setState(() {
      email = val.toString();
      if(email != 'null' && email != '') {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (BuildContext context) =>
                CoinHome()), (route) => false);
      }
    }));

    _getSavedEmail().then((val) => setState(() {
      savedEmail = val.toString();
      if(savedEmail != 'null' && savedEmail != '') {
        _usernameController.text = savedEmail;
      }
    }));
  }

  final UserRepository userRepository;
  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    bool _saving = false;

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 2),
              content:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "로그인 실패",
                  style: TextStyle(fontSize: 18),
                )
              ]),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is LoginSuccess) {
          // Navigator.of(context).pushNamedAndRemoveUntil(
          //     '/wallet', (Route<dynamic> route) => false);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (BuildContext context) =>
                  CoinHome()), (route) => false);
        }

      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        if (state is LoginLoading) {
          print("Loding...");
        }

        final Size size = MediaQuery.of(context).size;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: 
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              // 빈공간 클릭 시 키보드 사라짐.
            },
            child:
             SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 290,
                    // color: Colors.black,
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
                          height: size.height * 0.5,
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
                          height: size.height * 0.5,
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
                          child: Center(
                            child: Text(
                              "GMC",
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          height: size.height * 0.5,
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(children: [
                      Text(
                        "로그인",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 25),
                      TextFormField(
                        controller: _usernameController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 18),
                          labelText: '이메일을 입력해주세요.',
                          labelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
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
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          labelText: '비밀번호를 입력해주세요.',
                          labelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Checkbox(
                            value: checkBoxValue,
                            onChanged: (bool value) {
                              setState(() {
                                if (checkBoxValue == true) {
                                  checkBoxValue = false;
                                } else {
                                  checkBoxValue = true;
                                }
                              });
                            },
                            activeColor: Color(0xfff16c6c).withOpacity(0.8),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.white,
                                child: Text(
                                  "자동로그인",
                                  overflow: TextOverflow.fade,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          Checkbox(
                            value: checkBoxValue2,
                            onChanged: (bool value) {
                              setState(() {
                                if (checkBoxValue2 == true) {
                                  checkBoxValue2 = false;
                                } else {
                                  checkBoxValue2 = true;
                                }
                              });
                            },
                            activeColor: Color(0xfff16c6c).withOpacity(0.8),
                          ),
                          Container(
                            child: Text(
                              "아이디저장",
                              overflow: TextOverflow.fade,
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      // InkWell(
                      //   onTap: _onLoginButtonPressed2(),
                      //   child:
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              Color(0xffd25a7c),
                              Color(0xfff9cc83)
                            ])),
                        child: TextButton(
                          onPressed: _onLoginButtonPressed,
                          child: Center(
                            child: Text(
                              "로그인",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      // ),
                      SizedBox(height: 15),
                      buildsignBtn(),
                      SizedBox(height: 20),
                      buildsignUpBtn(),
                      SizedBox(height: 45),
                      buildkakaoSignUp(),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildsignBtn() {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "계정을 잊으셨나요?  ",
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        GestureDetector(
          onTap: () {
            Get.to(BuildFindID());
          },
          child: Text(
            'ID 찾기 ',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        Text(
          "또는 ",
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        GestureDetector(
          onTap: () {
            Get.to(BuildFindPassword());
          },
          child: Text(
            '비밀번호 찾기',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    ));
  }

  Widget buildsignUpBtn() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '아직 회원이 아니신가요?   ',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(BuildSingUp());
            },
            child: Text(
              '회원가입>',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildkakaoSignUp() {
    return Container(
      width: 315,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.yellow,
      ),
      child: TextButton(
        onPressed: () {},
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/Kakao.svg',
              height: 20,
              width: 50,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              SizedBox(width: 65),
              Text("카카오 로그인",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
            ]),
          ],
        ),
      ),
    );
  }

  String _validateEmail(String value) {
    if (value.isEmpty) {
      return '이메일을 입력하세요.';
    }
    if (!EmailValidator.validate(value)) {
      return '이메일 형식이 틀립니다.\n이메일을 확인해주세요.';
    }
    return null;
  }

  _onLoginButtonPressed() {
    String _emailMsg = _validateEmail(_usernameController.text);
    Pattern pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$';
    RegExp regExp = new RegExp(pattern);
    if (_emailMsg != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
        content: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            _emailMsg,
            style: TextStyle(fontSize: 18),
          ),
        ]),
        backgroundColor: Colors.red,
      ));
    } else if (_passwordController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
        content: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("비밀번호가 입력되지 않습니다.", style: TextStyle(fontSize: 18))
        ]),
        backgroundColor: Colors.red,
      ));
      _passwordController.text = "";
    } else if(!regExp.hasMatch(_passwordController.text)){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
        content: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("대소문자, 특수문자(!@#\$), 숫자로만 입력하세요.", style: TextStyle(fontSize: 18))
        ]),
        backgroundColor: Colors.red,
      ));
      _passwordController.text = "";
    }else if (_emailMsg == null && _passwordController.text != '') {
      if(checkBoxValue2 == true) {
        print("checkBoxValue2 true!!!!!!!!!!!!!!!!!!");
        _saveEmail();
      }
      _loginBloc.add(LoginButtonPressed(
          email: _usernameController.text, password: _passwordController.text));
    }
  }

  Future<String> _getEmail() async{
    final FlutterSecureStorage storage = FlutterSecureStorage();
    return await storage.read(key: "User");
  }

  _saveEmail() async{
    final FlutterSecureStorage storage = FlutterSecureStorage();
    storage.write(key: "email", value: _usernameController.text);
  }

  Future<String> _getSavedEmail() async{
    final FlutterSecureStorage storage = FlutterSecureStorage();
    return await storage.read(key: "email");
  }
}

// _validateEmail(String value) {
//   if (value.isEmpty) {
//     return '이메일을 입력하세요.';
//   }
//   if (!EmailValidator.validate(value)) {
//     return '이메일 형식이 틀립니다.\n이메일을 확인하세요.';
//   }
//   return null;
// }

// _onLoginButtonPressed2() {
//   String _emailMsg = _validateEmail(_usernameController.text);

//   if (_emailMsg != null) {
//     showToast(_emailMsg);
//   } else if (_passwordController.text == '') {
//     showToast("비밀번호가 입력되지 않았습니다.");
//     _passwordController.text = "";
//   } else if (_emailMsg == null && _passwordController.text != '') {
//     _loginBloc.add(LoginButtonPressed(
//         email: _usernameController.text, password: _passwordController.text));
//   }
// }

// void showToast(String message) {
//   Fluttertoast.showToast(
//       msg: message,
//       backgroundColor: Colors.white,
//       fontSize: 15,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.CENTER);
// }
