import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthenticationEvent extends Equatable{
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
  
}

class AppStarted extends AuthenticationEvent{}

class UserLoggedIn extends AuthenticationEvent{
  final String user;
  const UserLoggedIn({@required this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'LoggedIn {$user}';
  
}
 class UserLoggedOut extends AuthenticationEvent{}