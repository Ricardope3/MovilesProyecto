import 'package:Artemisa/models/authentication.dart';
import 'package:Artemisa/screens/welcome.dart';
import 'package:Artemisa/navWrapper.dart';
import 'package:Artemisa/landlord/landlordNavWrapper.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'screens/login.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  AuthModel authUser;
  bool isNewUser = false;
  bool debuggingLandlord = false; //TODO: Delete. Just for development purposes

  @override
  Widget build(BuildContext context) {
    authUser = Provider.of<AuthModel>(context);
    return _renderCorrectWidget();
  }

  Widget _renderCorrectWidget() {
    if (isNewUser) {
      return Welcome();
    } else {
      if (debuggingLandlord) {
        return LandlordNavWrapper();
      } else if (authUser.token != null) {
        return NavWrapper();
      } else {
        return Login();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _checkIfIsNewUser();
  }

  void _checkIfIsNewUser() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    var box = await Hive.openBox('newUserBox');
    int flag = box.get('newUser');
    if (flag == null) {
      //Is new User
      setState(() {
        isNewUser = true;
      });
      box.put("newUser", 1);
    }
  }
}
