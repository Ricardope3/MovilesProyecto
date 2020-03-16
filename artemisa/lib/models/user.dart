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

  User({
    @required this.email,
    @required this.gender,
    @required this.language,
    @required this.lastname,
    @required this.name,
    @required this.password,
    @required this.passwordConfirmation,
  });
  @override
  List<Object> get props =>
      [name, lastname, email, language, gender, password, passwordConfirmation];
}
