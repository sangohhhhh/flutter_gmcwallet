import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gmcwallet/Bloc/auth_bloc/Auth.dart';
import 'package:flutter_gmcwallet/Bloc/auth_bloc/AuthenticationBloc.dart';
import 'package:flutter_gmcwallet/Screen/CoinHome/CoinHome.dart';
import 'package:flutter_gmcwallet/Screen/HomeScreen.dart';
import 'package:flutter_gmcwallet/Simple_bloc_observer.dart';
import 'package:flutter_gmcwallet/repository/repository.dart';

import 'package:get/get_navigation/get_navigation.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final UserRepository userRepository = UserRepository();
  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) {
      return AuthenticationBloc(userRepository: userRepository)..add(AppStarted());
    },
    child: MyApp(userRepository: userRepository),
  ));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp({Key key, this.userRepository}) : super(key: key);

  // 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gmc Wallet',
      theme: ThemeData(),
      home: CoinHome(),
    );
  }
}
