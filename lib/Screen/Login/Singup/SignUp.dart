import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gmcwallet/Bloc/Signup_bloc/SignUpBloc.dart';
import 'package:flutter_gmcwallet/Bloc/auth_bloc/AuthenticationBloc.dart';
import 'package:flutter_gmcwallet/Screen/Login/ShapeClipper.dart';
import 'package:flutter_gmcwallet/Screen/Login/Singup/SignUpComplete.dart';
import 'package:flutter_gmcwallet/Screen/Login/Singup/SignUpForm.dart';
import 'package:flutter_gmcwallet/repository/repository.dart';
import 'package:get/get.dart';

class BuildSingUp extends StatefulWidget {
  final UserRepository userRepository;
  const BuildSingUp({Key key, this.userRepository}) : super(key: key);

  @override
  _BuildSingUpState createState() => _BuildSingUpState();
}

class _BuildSingUpState extends State<BuildSingUp> {
  bool value = false;
  final _formKey = GlobalKey<FormState>();
  var userRepository;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) {
          return SignUpBloc(
            userRepository: userRepository,
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          );
        },
        child: SignUpForm(userRepository: userRepository),
        //
        //
        //Column(children: <Widget>[
        //   Container(
        //     height: 290,
        //     child: Stack(children: <Widget>[
        //       ClipPath(
        //         clipper: ShapeClipper3(),
        //         child: Container(
        //           decoration: BoxDecoration(
        //             gradient: LinearGradient(colors: [
        //               Color(0xfff9cc83).withOpacity(0.9),
        //               Color(0xffe191a8),
        //             ]),
        //           ),
        //           height: size.height * 0.5,
        //         ),
        //       ),
        //       ClipPath(
        //         clipper: ShapeClipper2(),
        //         child: Container(
        //           decoration: BoxDecoration(
        //             gradient: LinearGradient(colors: [
        //               Color(0xffffb473).withOpacity(0.8),
        //               Color(0xffcc3494).withOpacity(0.8),
        //             ]),
        //           ),
        //           height: size.height * 0.5,
        //         ),
        //       ),
        //       ClipPath(
        //         clipper: ShapeClipper1(),
        //         child: Container(
        //             decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(10),
        //                 gradient: LinearGradient(colors: [
        //                   Color(0xffd25a7c),
        //                   Color(0xfff9cc83),
        //                 ])),
        //             child: Center(
        //               child: Text(
        //                 "GMC",
        //                 style: TextStyle(
        //                     fontSize: 50,
        //                     fontWeight: FontWeight.bold,
        //                     color: Colors.white),
        //               ),
        //             ),
        //             height: size.height * 0.5),
        //       ),
        //     ]),
        //   ),
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 30),
        //     child: Column(children: [
        //       Text(
        //         "회원가입",
        //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //       ),
        //       SizedBox(height: 20),
        //       TextFormField(
        //         style: TextStyle(
        //           color: Colors.black,
        //         ),
        //         decoration: InputDecoration(
        //           contentPadding:
        //               EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        //           labelText: '이메일을 입력해주세요.',
        //           labelStyle: TextStyle(
        //             fontSize: 15,
        //             fontWeight: FontWeight.bold,
        //             color: Colors.grey.shade500,
        //           ),
        //           focusedBorder: OutlineInputBorder(
        //             borderSide: BorderSide(color: Colors.grey.shade300),
        //           ),
        //           enabledBorder: OutlineInputBorder(
        //             borderSide: BorderSide(
        //               color: Colors.grey.shade300,
        //             ),
        //           ),
        //           border: UnderlineInputBorder(borderSide: BorderSide.none),
        //         ),
        //       ),
        //       SizedBox(height: 10),
        //       // PhoneNumber(),
        //       // SizedBox(height: 5),
        //       Row(
        //         children: [
        //           Container(
        //             width: 80,
        //             child: TextFormField(
        //               style: TextStyle(
        //                 color: Colors.black,
        //               ),
        //               decoration: InputDecoration(
        //                 contentPadding:
        //                     EdgeInsets.symmetric(horizontal: 26, vertical: 5),
        //                 hintText: '010',
        //                 hintStyle: TextStyle(
        //                   fontSize: 15,
        //                   fontWeight: FontWeight.w500,
        //                   color: Colors.black,
        //                 ),
        //                 focusedBorder: OutlineInputBorder(
        //                   borderSide: BorderSide(color: Colors.grey.shade300),
        //                 ),
        //                 enabledBorder: OutlineInputBorder(
        //                   borderSide: BorderSide(
        //                     color: Colors.grey.shade300,
        //                   ),
        //                 ),
        //                 border:
        //                     UnderlineInputBorder(borderSide: BorderSide.none),
        //               ),
        //             ),
        //           ),
        //           Text("―"),
        //           Container(
        //             width: 80,
        //             child: TextFormField(
        //               style: TextStyle(
        //                 color: Colors.black,
        //               ),
        //               decoration: InputDecoration(
        //                 contentPadding:
        //                     EdgeInsets.symmetric(horizontal: 21, vertical: 5),
        //                 hintText: '7777',
        //                 hintStyle: TextStyle(
        //                   fontSize: 15,
        //                   fontWeight: FontWeight.w500,
        //                   color: Colors.black,
        //                 ),
        //                 focusedBorder: OutlineInputBorder(
        //                   borderSide: BorderSide(color: Colors.grey.shade300),
        //                 ),
        //                 enabledBorder: OutlineInputBorder(
        //                   borderSide: BorderSide(
        //                     color: Colors.grey.shade300,
        //                   ),
        //                 ),
        //                 border:
        //                     UnderlineInputBorder(borderSide: BorderSide.none),
        //               ),
        //             ),
        //           ),
        //           Text("―"),
        //           Container(
        //             width: 80,
        //             child: TextFormField(
        //               style: TextStyle(
        //                 color: Colors.black,
        //               ),
        //               decoration: InputDecoration(
        //                 contentPadding:
        //                     EdgeInsets.symmetric(horizontal: 21, vertical: 5),
        //                 hintText: '7777',
        //                 hintStyle: TextStyle(
        //                   fontSize: 15,
        //                   fontWeight: FontWeight.w500,
        //                   color: Colors.black,
        //                 ),
        //                 focusedBorder: OutlineInputBorder(
        //                   borderSide: BorderSide(color: Colors.grey.shade300),
        //                 ),
        //                 enabledBorder: OutlineInputBorder(
        //                   borderSide: BorderSide(
        //                     color: Colors.grey.shade300,
        //                   ),
        //                 ),
        //                 border:
        //                     UnderlineInputBorder(borderSide: BorderSide.none),
        //               ),
        //             ),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 3),
        //             child: Container(
        //               height: 50,
        //               decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(10),
        //                   gradient: LinearGradient(
        //                       colors: [Color(0xffd25a7c), Color(0xfff9cc83)])),
        //               child: TextButton(
        //                   onPressed: () {
        //                     if (_formKey.currentState.validate()) {
        //                       ScaffoldMessenger.of(context)
        //                           .showSnackBar(SnackBar(
        //                         content: const Text('Processing Data'),
        //                       ));
        //                     }
        //                     // Get.to(SingUpEmail());
        //                   },
        //                   child: Text(
        //                     "인증",
        //                     style: TextStyle(
        //                         color: Colors.white,
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 15),
        //                   )),
        //             ),
        //           ),
        //         ],
        //       ),
        //       SizedBox(height: 5),
        //       Form(
        //         key: _formKey,
        //         child: Column(
        //           children: <Widget>[
        //             TextFormField(
        //               decoration: InputDecoration(
        //                 contentPadding:
        //                     EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        //                 labelText: '인증번호를 입력해주세요.',
        //                 labelStyle: TextStyle(
        //                   fontSize: 15,
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.grey.shade500,
        //                 ),
        //                 filled: true,
        //                 fillColor: Colors.grey.shade300,
        //                 focusColor: Colors.grey.shade300,
        //                 focusedBorder: OutlineInputBorder(
        //                   borderSide: BorderSide(color: Colors.grey.shade300),
        //                 ),
        //                 enabledBorder: OutlineInputBorder(
        //                   borderSide: BorderSide(
        //                     color: Colors.grey.shade300,
        //                   ),
        //                 ),
        //                 // errorText: '인증번호가 일치하지 않습니다.',
        //               ),
        //               validator: (value) {
        //                 if (value.isEmpty) {
        //                   return '인증번호를 입력해주세요.';
        //                 } else
        //                   return '인증번호가 일치하지 않습니다.';
        //               },
        //             ),
        //           ],
        //         ),
        //       ),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       Container(
        //         child: TextFormField(
        //           style: TextStyle(
        //             color: Colors.black,
        //           ),
        //           decoration: InputDecoration(
        //             contentPadding:
        //                 EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        //             labelText: '비밀번호를 입력해주세요.',
        //             labelStyle: TextStyle(
        //               fontSize: 15,
        //               fontWeight: FontWeight.bold,
        //               color: Colors.grey.shade500,
        //             ),
        //             focusedBorder: OutlineInputBorder(
        //               borderSide: BorderSide(color: Colors.grey.shade300),
        //             ),
        //             enabledBorder: OutlineInputBorder(
        //               borderSide: BorderSide(
        //                 color: Colors.grey.shade300,
        //               ),
        //             ),
        //             border: UnderlineInputBorder(borderSide: BorderSide.none),
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       Container(
        //         child: TextFormField(
        //           style: TextStyle(
        //             color: Colors.black,
        //           ),
        //           decoration: InputDecoration(
        //             contentPadding:
        //                 EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        //             labelText: '다시한번 비밀번호를 입력해주세요.',
        //             labelStyle: TextStyle(
        //               fontSize: 15,
        //               fontWeight: FontWeight.bold,
        //               color: Colors.grey.shade500,
        //             ),
        //             focusedBorder: OutlineInputBorder(
        //               borderSide: BorderSide(color: Colors.grey.shade300),
        //             ),
        //             enabledBorder: OutlineInputBorder(
        //               borderSide: BorderSide(
        //                 color: Colors.grey.shade300,
        //               ),
        //             ),
        //             border: UnderlineInputBorder(borderSide: BorderSide.none),
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         height: 15,
        //       ),
        //       Container(
        //         height: 20,
        //         child: Row(children: <Widget>[
        //           Checkbox(
        //               value: value,
        //               onChanged: (value) {
        //                 setState(() {
        //                   this.value = value;
        //                 });
        //               }),
        //           Text(
        //             "약관에 동의합니다.",
        //             style: TextStyle(
        //               fontSize: 15,
        //               fontWeight: FontWeight.bold,
        //               color: Colors.grey.shade500,
        //             ),
        //           ),
        //         ]),
        //       ),
        //       SizedBox(height: 20),
        //       Container(
        //         height: 55,
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             gradient: LinearGradient(
        //                 colors: [Color(0xffd25a7c), Color(0xfff9cc83)])),
        //         child: TextButton(
        //           onPressed: () {
        //             Get.to(SingUpComplated());
        //           },
        //           child: Center(
        //             child: Text(
        //               "가입완료",
        //               style: TextStyle(
        //                   color: Colors.white,
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 18),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ]),
        //   ),
        // ]),
      ),
    );
  }
}
