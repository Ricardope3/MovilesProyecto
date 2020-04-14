import 'package:Artemisa/classes/user.dart';
import 'package:Artemisa/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier {
  User _user;

  User get user => _user;

  set user(User newUser) {
    assert(newUser != null);
    _user = newUser;
    notifyListeners();
  }

  Future<User> registerUser(User user) async {
    User newUser = await AuthRepository().register(user);
    return newUser;
  }
}
