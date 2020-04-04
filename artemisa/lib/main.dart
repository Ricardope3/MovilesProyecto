import 'package:Artemisa/models/authentication.dart';
import 'package:Artemisa/util/main_util.dart';
import 'package:Artemisa/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Artemisa',
        theme: theme,
        home: Wrapper(),
        routes: routes,
      ),
    );
  }
}
