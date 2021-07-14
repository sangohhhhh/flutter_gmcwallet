import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gmcwallet/Bloc/auth_bloc/AuthenticationBloc.dart';
import 'package:flutter_gmcwallet/Bloc/auth_bloc/AuthenticationEvent.dart';
import 'package:flutter_gmcwallet/Bloc/login_bloc/LoginEvent.dart';
import 'package:flutter_gmcwallet/Bloc/login_bloc/LoginState.dart';
import 'package:flutter_gmcwallet/repository/repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  final _userRepository = UserRepository();

  LoginBloc({@required this.userRepository, @required this.authenticationBloc})
      // : assert(userRepository != null),
      : assert(authenticationBloc != null),
        super(null);

  
  LoginState get initialState => LoginInitial();
  
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final user = await _userRepository.login(event.email, event.password);
        authenticationBloc.add(LoggedIn(user: user));
        yield LoginSuccess();
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: "Someting very weird just happened");
      }
    } 
  }
}

AuthenticationEvent LoggedIn({String user}) {}
