import 'package:Artemisa/Authentication/register_bloc.dart';
import 'package:Artemisa/stack/register_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Register extends StatefulWidget {
  Register();
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context)  {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          if (state is RegisterInitial) {
            return buildRegisterWidget(height, width);
          } else if (state is Registering) {
            return buildRegisteringWidget(context);
          } else if (state is Registered) {
            return buildRegisteredWidget();
          }
          return buildRegisterWidget(height, width);
        },
      ),
    );
  }

  Center buildRegisteredWidget() {
    return Center(child: Text("Redireccionando"));
  }

  Center buildRegisteringWidget(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        child: LoadingIndicator(
          indicatorType: Indicator.pacman,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }

  Widget buildRegisterWidget(
    double height,
    double width,
  ) {
    return RegisterWidget(height: height, width: width);
  }
}
