import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gmcwallet/Bloc/auth_bloc/Auth.dart';
import 'package:flutter_gmcwallet/Bloc/login_bloc/LoginBloc.dart';
import 'package:flutter_gmcwallet/Screen/Login/loginForm.dart';
import 'package:flutter_gmcwallet/repository/repository.dart';

class LoginScreen extends StatefulWidget {
  // final Function press;
  final UserRepository userRepository;
  const LoginScreen({Key key, this.userRepository})
      // : assert(userRepository != null),
      : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var userRepository;

  // bool checkBoxValue = false;
  // bool checkBoxValue2 = false;

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            userRepository: userRepository,
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          );
        },
        child: LoginForm(
          userRepository: userRepository,
        ),
      ),
    );
  }
}
