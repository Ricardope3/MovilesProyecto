import 'package:artemisa/screens/home.dart';
import 'package:artemisa/screens/login.dart';
import 'package:artemisa/screens/register.dart';
import 'package:artemisa/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  runApp(MyApp());
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  var box = await Hive.openBox('users');
  agregarUsuarioNuevo();
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
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/register': (context) => Register(),
        '/wrapper': (context) => Wrapper(),
        '/home': (context) => Home(),
      },
    );
  }
}

void agregarUsuarioNuevo() async {
  var box = await Hive.openBox('users');
  if (!box.containsKey("visited")) {
    box.put("visited", 1);
  }
}
