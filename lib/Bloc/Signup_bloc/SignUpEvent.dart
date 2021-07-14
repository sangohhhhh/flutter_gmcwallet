import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
  @override
  List<Object> get props => [];
}

class SignUpEmailChanged extends SignUpEvent {
  final String email;

  SignUpEmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class SignUpPhoneNumberPressed extends SignUpEvent {
  final String phoneNumber;

  SignUpPhoneNumberPressed(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class SignUpPasswordChanged extends SignUpEvent {
  final String password;
  final String confirmPassword;

  SignUpPasswordChanged(this.password, this.confirmPassword);

  @override
  List<Object> get props => [password, confirmPassword];
}

class SignUpButtonPressed extends SignUpEvent {
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;

  SignUpButtonPressed(
      this.email, this.phoneNumber, this.password, this.confirmPassword);
  @override
  List<Object> get props => [email, phoneNumber, password, confirmPassword];
}
