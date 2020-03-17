import 'package:Artemisa/Authentication/register_bloc.dart';
import 'package:Artemisa/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Login extends StatefulWidget {
  Login();

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          if (state is RegisterInitial) {
            return buildLoginWidget(height, width);
          } else if (state is Registering) {
            return buildRegisteringWidget(context);
          } else if (state is Registered) {
            return buildRegisteredWidget();
          }
          return buildLoginWidget(height, width);
        },
      ),
    );
  }

  Center buildRegisteredWidget() {
    return Center(heightFactor: 20, child: Text("Redireccionando"));
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

  Widget buildLoginWidget(double height, double width) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            height: height,
            width: width,
          ),
          BackgroundContainer(width: width, height: height),
          Positioned(
            top: height * 0.6,
            child: LoginWidget(
              height: height,
              width: width,
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundContainer extends StatelessWidget {
  final double width;
  final double height;
  BackgroundContainer({this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.68,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/images/login0.jpeg",
            ),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Text(
          "Artemisa",
          style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: Colors.white),
        ),
      ),
    );
  }
}


class LoginWidget extends StatelessWidget {
  final double width, height;
  LoginWidget({this.height, this.width});
  RegisterBloc registerBloc;
  @override
  Widget build(BuildContext context) {
    registerBloc = BlocProvider.of<RegisterBloc>(context);
    return Container(
      height: height * 0.4,
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Transform.translate(
              offset: Offset(0, -47),
              child: Align(
                alignment: Alignment.centerRight,
                child: Material(
                  elevation: 15,
                  shadowColor: Colors.black45,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  color: Theme.of(context).primaryColorLight,
                  child: InkWell(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    splashColor: Colors.white,
                    onTap: () {
                      registerBloc.add(
                        OnRegister(
                          user: User(
                            name: "Ricardo",
                            email: "ricky.foals@gmail.com",
                            gender: "Male",
                            language: "es",
                            lastname: "Espinoza",
                            password: "123",
                            passwordConfirmation: "123",
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 95,
                      height: 95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              width: width,
              child: Transform.translate(
                offset: Offset(0, -40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Please sign in",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    Form(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            onChanged: (val) {},
                            decoration: new InputDecoration(
                              hintText: 'E-mail',
                            ),
                          ),
                          TextFormField(
                            obscureText: true,
                            onChanged: (val) {},
                            style: TextStyle(letterSpacing: 7),
                            decoration: new InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(letterSpacing: 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            //height: 55,
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, "/register");
                          },
                          child: Container(
                            //height: 55,
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
