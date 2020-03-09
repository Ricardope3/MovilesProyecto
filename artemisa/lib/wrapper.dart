import 'package:artemisa/screens/login.dart';
import 'package:artemisa/screens/register.dart';
import 'package:artemisa/screens/welcome.dart';
import 'package:flutter/material.dart';


class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Welcome();
  }
}