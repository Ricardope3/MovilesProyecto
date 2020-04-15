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
    this.email,
    this.gender,
    this.language,
    this.lastname,
    this.name,
    this.password,
    this.passwordConfirmation,
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
