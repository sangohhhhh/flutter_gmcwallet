
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gmcwallet/Bloc/Signup_bloc/SignUpBloc.dart';
import 'package:flutter_gmcwallet/Bloc/Signup_bloc/SignUpEvent.dart';
import 'package:flutter_gmcwallet/Bloc/Signup_bloc/SignUpState.dart';
import 'package:flutter_gmcwallet/Screen/Login/ShapeClipper.dart';
import 'package:flutter_gmcwallet/common/data.dart';
import 'package:flutter_gmcwallet/repository/repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'SignUpComplete.dart';

class SignUpForm extends StatefulWidget {
  final UserRepository userRepository;
  const SignUpForm({Key key, this.userRepository})
      // : assert(userRepository != null)
      : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}



class _SignUpFormState extends State<SignUpForm> {
  bool value = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordController2 = TextEditingController();
  final _phoneNumberController1 = TextEditingController();
  final _phoneNumberController2 = TextEditingController();
  final _phoneNumberController3 = TextEditingController();

  SignUpBloc _signUpBloc;

  @override
  void initState() {
    super.initState();
    _signUpBloc = BlocProvider.of<SignUpBloc>(context);
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 2),
              content:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "회원가입 실패",
                  style: TextStyle(fontSize: 18),
                )
              ]),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is SignUpSuccess) {
          // Navigator.of(context).pushNamedAndRemoveUntil(
          //     '/wallet', (Route<dynamic> route) => false);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (BuildContext context) =>
                  SingUpComplated()), (route) => false);
        }

      },
      child: BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
        Size size = MediaQuery.of(context).size;
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
                    height: size.height * 0.5,
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
                          ])),
                      child: Center(
                        child: Text(
                          "GMC",
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      height: size.height * 0.5),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(children: [
                Text(
                  "회원가입",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
                SizedBox(height: 10),
                // PhoneNumber(),
                // SizedBox(height: 5),
                Row(
                  children: [
                    Container(
                      width: 80,
                      child: TextFormField(
                        controller: _phoneNumberController1,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 26, vertical: 5),
                          hintText: '',
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
                          border:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    Text("―"),
                    Container(
                      width: 80,
                      child: TextFormField(
                        controller: _phoneNumberController2,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 21, vertical: 5),
                          hintText: '',
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
                          border:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    Text("―"),
                    Container(
                      width: 80,
                      child: TextFormField(
                        controller: _phoneNumberController3,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 21, vertical: 5),
                          hintText: '',
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
                          border:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [Color(0xffd25a7c), Color(0xfff9cc83)])),
                        child: TextButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: const Text('Processing Data'),
                                ));
                              }
                              // Get.to(SingUpEmail());
                            },
                            child: Text(
                              "인증",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          // errorText: '인증번호가 일치하지 않습니다.',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return '인증번호를 입력해주세요.';
                          } else
                            return '인증번호가 일치하지 않습니다.';
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      labelText: '비밀번호를 입력해주세요.',
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
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextFormField(
                    controller: _passwordController2,
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      labelText: '다시한번 비밀번호를 입력해주세요.',
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
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 20,
                  child: Row(children: <Widget>[
                    Checkbox(
                        value: value,
                        onChanged: (value) {
                          setState(() {
                            this.value = value;
                          });
                        }),
                    Text(
                      "약관에 동의합니다.",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ]),
                ),
                SizedBox(height: 20),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [Color(0xffd25a7c), Color(0xfff9cc83)])),
                  child: TextButton(
                    onPressed: _onSignUpButtonPressed,
                    //     () {
                    //   Get.to(SingUpComplated());
                    // },
                    child: Center(
                      child: Text(
                        "가입완료",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ]),
        );
      }),
    );
  }


  _onSignUpButtonPressed() {

    String _emailMsg = _validateEmail(_emailController.text);
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
          Text("비밀번호가 입력되지 않았습니다.", style: TextStyle(fontSize: 18))
        ]),
        backgroundColor: Colors.red,
      ));
      _passwordController.text = "";
    } else if (_passwordController2.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
        content: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("비밀번호 확인이 입력되지 않았습니다.", style: TextStyle(fontSize: 18))
        ]),
        backgroundColor: Colors.red,
      ));
      _passwordController2.text = "";
    } else if(_phoneNumberController1.text == '' || _phoneNumberController2.text == '' || _phoneNumberController3.text == '' ) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
        content: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("휴대폰 번호가 입력되지 않았습니다.", style: TextStyle(fontSize: 18))
        ]),
        backgroundColor: Colors.red,
      ));
    } else if (_emailMsg == null && _passwordController.text != '') {
      String phone = _phoneNumberController1.text + "-" + _phoneNumberController2.text + "-" + _phoneNumberController3.text;

      // _signUpBloc.add(SignUpEmailChanged("", "", "", ""));

      //_signUpBloc.add();

      SignUpEvent _signUpEvent = SignUpButtonPressed(
          _emailController.text,
          phone,
          _passwordController.text,
          _passwordController2.text
      );

      _signUpBloc.add(_signUpEvent);

    }
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


}