import 'package:Artemisa/navWrapper.dart';
import 'package:Artemisa/screens/bookings.dart';
import 'package:Artemisa/screens/chats.dart';
import 'package:Artemisa/screens/login.dart';
import 'package:Artemisa/screens/details.dart';
import 'package:Artemisa/screens/profile.dart';
import 'package:Artemisa/screens/register.dart';
import 'package:Artemisa/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


Future<bool> _checkIfIsNewUser() async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  var box = await Hive.openBox('newUserBox');
  int flag = box.get('newUser');
  if (flag == null) {
    //Is new User
    box.put("newUser", 1);
    return true;
  }
  return false;
}

final ThemeData theme = ThemeData(
  primaryColor: Color.fromRGBO(214, 177, 72, 1),
  primaryColorLight: Color.fromRGBO(195, 226, 236, 1),
  backgroundColor: Color.fromRGBO(246, 246, 246, 1),
  accentColor: Color.fromRGBO(97, 156, 201, 1),
);

final Map<String, Widget Function(BuildContext)> routes = {
  // When navigating to the "/" route, build the FirstScreen widget.
  '/': (context) => FutureBuilder(
        future: _checkIfIsNewUser(),
        initialData: false,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.data ? Welcome() : Login();
        },
      ),
  '/login': (context) => Login(),
  '/register': (context) => Register(),
  '/bookings': (context) => Bookings(),
  '/chats': (context) => Chats(),
  '/profile': (context) => Profile(),
  '/navWrapper': (context) => NavWrapper()
};
