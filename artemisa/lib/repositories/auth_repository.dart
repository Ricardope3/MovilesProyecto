import 'package:Artemisa/models/user.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepository {
  String _baseUrl = "http://192.168.100.6/api/";
  String _register = "users/register";
  String _login = "users/login";
  Map<String, String> _headers = {"Content-Type": "application/json"};

  Future<User> register(User user) async {
    String url = "$_baseUrl$_register";
    Map data = {
      "name": user.name,
      "password": user.password,
      "lastname": "lastname",
      "email": user.email,
      "picture": "pic",
      "language": "es",
      "gender": "male",
      "password_confirmation": user.password,
    };
    print(data);
    var body = json.encode(data);
    var response = await http.post(
      url,
      headers: _headers,
      body: body,
    );
    if (response.statusCode == 200) {
      final jsonObj = json.decode(response.body);
      user.token = jsonObj['token'];
      user.id = jsonObj['userId'];
      return user;
    } else {
      print(response.body);
      return null;
    }
  }

  Future<User> login(User user) async {
    String url = "$_baseUrl$_login";
    Map data = {
      "email": user.email,
      "password": user.password,
    };
    var body = json.encode(data);
    var response = await http.post(
      url,
      headers: _headers,
      body: body,
    );
    if (response.statusCode == 200) {
      final jsonObj = json.decode(response.body);
      user.token = jsonObj['token'];
      user.id = jsonObj['userId'];
      return user;
    } else {
      return null;
    }
  }
}
