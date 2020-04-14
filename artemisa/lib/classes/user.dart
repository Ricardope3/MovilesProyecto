import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class User extends Equatable {
  final String name,
      lastname,
      email,
      language,
      gender,
      password,
      passwordConfirmation;
  String id, token;

  User({
    @required this.email,
    @required this.gender,
    @required this.language,
    @required this.lastname,
    @required this.name,
    @required this.password,
    @required this.passwordConfirmation,
  });

  set setId(String newId) => this.id = newId;
  set setToken(String newToken) => this.token = newToken;

  @override
  List<Object> get props => [
        id,
        name,
        lastname,
        email,
        language,
        gender,
        password,
        passwordConfirmation,
      ];
}
