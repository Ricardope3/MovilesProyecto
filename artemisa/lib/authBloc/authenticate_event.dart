

import 'package:Artemisa/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthenticateEvent extends Equatable {
  const AuthenticateEvent();
}

class OnRegister extends AuthenticateEvent {

  final User user;
  OnRegister({
    @required this.user,
  });
  @override
  List<Object> get props => [user];
}
class OnLogin extends AuthenticateEvent {

  final User user;
  OnLogin({
    @required this.user,
  });
  @override
  List<Object> get props => [user];
}