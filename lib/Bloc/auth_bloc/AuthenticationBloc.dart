import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gmcwallet/Bloc/auth_bloc/Auth.dart';
import 'package:flutter_gmcwallet/repository/repository.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null),
        super(null);


  AuthenticationState get initialState => AuthenticationUninitialized();

@override
Stream<AuthenticationState> mapEventToState(
  AuthenticationEvent event,
) async* {
  if (event is AppStarted) {
    final bool hasUser = await userRepository.hasUser();
    if (hasUser) {
      yield AuthenticationAuthenticated();
    } else {
      yield AuthenticationUnauthenticated();
    }
  }
  if (event is UserLoggedIn) {
    yield AuthenticationLoading();
    await userRepository.persisteUser(event.user);
    yield AuthenticationAuthenticated();
  }
  if (event is UserLoggedOut) {
    yield AuthenticationLoading();
    await userRepository.deleteUser();
    yield AuthenticationAuthenticated();
  }
}
}