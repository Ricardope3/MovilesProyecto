import 'package:Artemisa/authBloc/authenticate_bloc.dart';
import 'package:Artemisa/util/main_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticateBloc>(
          create: (BuildContext context) => AuthenticateBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Artemisa',
        theme: theme,
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
