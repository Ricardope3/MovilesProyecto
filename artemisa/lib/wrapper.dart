import 'package:Artemisa/screens/welcome.dart';
import 'package:Artemisa/navWrapper.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'screens/login.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool authenticated = false;
  bool isNewUser = false;
  @override
  Widget build(BuildContext context) {
    return _renderCorrectWidget();
  }

  Widget _renderCorrectWidget() {
    if (isNewUser) {
      return Welcome();
    } else {
      if (authenticated) {
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
