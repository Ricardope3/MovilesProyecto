import 'package:Artemisa/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


abstract class AuthenticateState extends Equatable {
  const AuthenticateState();
}

class AuthenticateInitial extends AuthenticateState {
  @override
  List<Object> get props => [];
}

class Authenticating extends AuthenticateState {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthenticateState {
  final User user;
  Authenticated({
    @required this.user,
  });
  @override
  List<Object> get props => [user];
}

class AuthenticateError extends AuthenticateState {
  final String message;
  AuthenticateError({
    @required this.message,
  });
  @override
  List<Object> get props => [message];
}


class LoginIn extends AuthenticateState {
  @override
  List<Object> get props => [];
}

class LoginError extends AuthenticateState {
  final String message;
  LoginError({
    @required this.message,
  });
  @override
  List<Object> get props => [message];
}