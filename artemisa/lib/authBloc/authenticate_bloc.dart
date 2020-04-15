import 'dart:async';
import 'package:Artemisa/models/user.dart';
import 'package:Artemisa/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';

import 'authenticate_event.dart';
import 'authenticate_state.dart';

class AuthenticateBloc extends Bloc<AuthenticateEvent, AuthenticateState> {
  AuthRepository userRepository = AuthRepository();
  @override
  AuthenticateState get initialState => AuthenticateInitial();

  @override
  Stream<AuthenticateState> mapEventToState(
    AuthenticateEvent event,
  ) async* {
    if (event is OnRegister) {
      yield Authenticating();
      User user = await userRepository.register(event.user);
      if (user != null) {
        yield Authenticated(user: user);
      } else {
        yield AuthenticateError(message: "Error al Registrar");
      }
    } else if (event is OnLogin) {
      yield Authenticating();
      User user = await userRepository.login(event.user);
      if (user != null) {
        yield Authenticated(user: user);
      } else {
        yield AuthenticateError(message: "Error al Iniciar Sesion");
      }
    }
  }
}
