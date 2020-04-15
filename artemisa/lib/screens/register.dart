import 'package:Artemisa/authBloc/authenticate_bloc.dart';
import 'package:Artemisa/authBloc/authenticate_state.dart';
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
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocListener<AuthenticateBloc, AuthenticateState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushReplacementNamed(context, '/navWrapper');
          } else if (state is AuthenticateError) {
            final snackBar = SnackBar(content: Text('Error al iniciar sesion'));
            Scaffold.of(context).showSnackBar(snackBar);
          }
        },
        child: BlocBuilder<AuthenticateBloc, AuthenticateState>(
          builder: (context, state) {
            if (state is AuthenticateInitial) {
              return buildRegisterWidget(height, width);
            } else if (state is Authenticating) {
              return buildRegisteringWidget(context);
            } else if (state is AuthenticateError) {
              return buildRegisterWidget(height, width);
            } else {
              return Center(child: Text("Hubo un error lmao"));
            }
          },
        ),
      ),
    );
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
