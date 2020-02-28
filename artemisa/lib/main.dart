import 'package:artemisa/wrapper.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Artemisa',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(236, 192, 191,1),
        primaryColorLight: Color.fromRGBO( 251, 227, 227,1),
        backgroundColor: Color.fromRGBO(246, 246, 246,1), 
        accentColor: Color.fromRGBO(135, 134, 160,1),
      ),
      home: Wrapper(),
    );
  }
}