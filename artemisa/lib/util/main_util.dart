import 'package:Artemisa/navWrapper.dart';
import 'package:Artemisa/screens/bookings.dart';
import 'package:Artemisa/screens/chats.dart';
import 'package:Artemisa/screens/home.dart';
import 'package:Artemisa/screens/login.dart';
import 'package:Artemisa/screens/profile.dart';
import 'package:Artemisa/screens/register.dart';
import 'package:flutter/material.dart';

import '../wrapper.dart';

final ThemeData theme = ThemeData(
  primaryColor: Color.fromRGBO(214, 177, 72, 1),
  primaryColorLight: Color.fromRGBO(195, 226, 236, 1),
  backgroundColor: Color.fromRGBO(246, 246, 246, 1),
  accentColor: Color.fromRGBO(97, 156, 201, 1),
);

final Map<String, Widget Function(BuildContext)> routes = {
  // When navigating to the "/" route, build the FirstScreen widget.
  '/login': (context) => Login(),
  '/register': (context) => Register(),
  '/wrapper': (context) => Wrapper(),
  '/home': (context) => Home(),
  '/bookings': (context) => Bookings(),
  '/chats': (context) => Chats(),
  '/profile': (context) => Profile(),
  '/navWrapper': (context) => NavWrapper()
};
