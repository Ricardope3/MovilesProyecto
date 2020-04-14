import 'package:Artemisa/models/authentication.dart';
import 'package:Artemisa/navWrapper.dart';
import 'package:Artemisa/landlord/landlordNavWrapper.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/login.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  AuthModel authModel;
  bool debuggingLandlord = false; //TODO: Delete. Just for development purposes

  @override
  Widget build(BuildContext context) {
    authModel = Provider.of<AuthModel>(context, listen: false);
    return _renderCorrectWidget();
  }

  Widget _renderCorrectWidget() {
    if (debuggingLandlord) {
      return LandlordNavWrapper();
    } else if (authModel.user.token != null) {
      return NavWrapper();
    } else {
      return Login();
    }
  }

  @override
  void initState() {
    super.initState();
  }
}
