import 'dart:async';
import 'package:Artemisa/Repositories/register_respository.dart';
import 'package:Artemisa/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterUser userRepository = RegisterUser();
  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is OnRegister) {
      yield Registering();
      try {
        User user = await userRepository.register(event.user);
        yield Registered(user: user);
      } catch (e) {
        print(e.toString());
        yield RegisterError(message: e.toString());
      }
    }
  }
}
