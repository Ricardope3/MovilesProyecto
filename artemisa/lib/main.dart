import 'package:artemisa/screens/home.dart';
import 'package:artemisa/screens/login.dart';
import 'package:artemisa/screens/register.dart';
import 'package:artemisa/wrapper.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Artemisa',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(214, 177, 72, 1),
        primaryColorLight: Color.fromRGBO(195, 226, 236, 1),
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        accentColor: Color.fromRGBO(97, 156, 201, 1),
      ),
      home: Wrapper(),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/wrapper': (context) => Wrapper(),
        '/home': (context) => Home(),
              },
    );
  }
}


