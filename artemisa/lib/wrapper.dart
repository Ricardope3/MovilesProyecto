import 'package:artemisa/Authentication/bloc/register_bloc.dart';
import 'package:artemisa/screens/home.dart';
import 'package:artemisa/screens/register.dart';
import 'package:artemisa/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool authenticated = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: Hive.openBox("users"),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text("Error");
          }
          return BlocProvider(
            create: (BuildContext context) => RegisterBloc(),
            child: BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                print(state.toString());
                if (state is Registered) {
                  setState(() {
                    authenticated = true;
                  });
                }
              },
              child: Container(
                child: authenticated ? Home() : Register(),
              ),
            ),
          );
        } else {
          return BlocProvider(
            create: (BuildContext context) => RegisterBloc(),
            child: BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                print(state.toString());
                if (state is Registered) {
                  setState(() {
                    authenticated = true;
                  });
                }
              },
              child: Container(
                child: authenticated ? Home() : Register(),
              ),
            ),
          );
        }
        ;
      },
    );
  }

/*   Future<Box> inicializarBox() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();

    Hive.init(appDocumentDir.path);

    return Hive.openBox("users");
  } */
}
