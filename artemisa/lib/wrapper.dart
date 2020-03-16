import 'package:artemisa/screens/home.dart';
import 'package:artemisa/screens/login.dart';
import 'package:artemisa/screens/register.dart';
import 'package:artemisa/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'Authentication/register_bloc.dart';
import 'package:path_provider/path_provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool authenticated = false;
  bool isNewUser = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterBloc(),
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is Registered) {
            setState(() {
              authenticated = true;
            });
          }
        },
        child: Container(
          child: isNewUser ? Welcome() : Home(),
        ),
      ),
    );
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
