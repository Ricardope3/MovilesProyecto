import 'package:Artemisa/classes/user.dart';
import 'package:Artemisa/repositories/register_repository.dart';
import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier {
  String _token;
  User _user;

  String get token => _token;
  User get user => _user;

  set token(String newToken) {
    assert(newToken != null);
    _token = newToken;
    notifyListeners();
  }

  set user(User newUser) {
    assert(newUser != null);
    _user = newUser;
    notifyListeners();
  }

  Future<User> registerUser(User user) async {
    User newUser = await RegisterUser().register(user);
    return newUser;
  }
}
