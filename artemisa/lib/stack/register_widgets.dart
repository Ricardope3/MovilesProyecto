import 'package:Artemisa/classes/user.dart';
import 'package:Artemisa/models/authentication.dart';
import 'package:Artemisa/models/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterWidget extends StatelessWidget {
  final double width, height;
  RegisterWidget({this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            height: height,
            width: width,
          ),
          BackgroundContainer(
            width: width,
            height: height,
          ),
          RegisterFormWidget(
            height: height,
            width: width,
          ),
          FloatingButton(
            height: height,
            width: width,
          ),
        ],
      ),
    );
  }
}

class RegisterFormWidget extends StatefulWidget {
  final double width, height;

  RegisterFormWidget({this.height, this.width});

  @override
  _RegisterFormWidgetState createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.height * 0.5,
      child: Container(
        height: widget.height * 0.5,
        width: widget.width,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                width: widget.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Crear cuenta",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                              onChanged: (val) {},
                              decoration: new InputDecoration(
                                hintText: 'Nombre',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Por favor, escribe tu nombre';
                                }
                                RegExp regex = new RegExp(r'\w+');
                                if (!regex.hasMatch(value)) {
                                  return 'El nombre sólo debe contener letras';
                                }
                                return null;
                              }),
                          TextFormField(
                              onChanged: (val) {},
                              decoration: new InputDecoration(
                                hintText: 'Apellido',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Por favor, escribe tu apellido';
                                }
                                RegExp regex = new RegExp(r'\w+');
                                if (!regex.hasMatch(value)) {
                                  return 'El apellido sólo debe contener letras';
                                }
                                return null;
                              }),
                          TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (val) {},
                              decoration: new InputDecoration(
                                hintText: 'E-mail',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Por favor, escribe tu e-mail';
                                }
                                RegExp regex = new RegExp(
                                    r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                                if (!regex.hasMatch(value)) {
                                  return 'Por favor, escribe un e-mail válido';
                                }
                                return null;
                              }),
                          TextFormField(
                              obscureText: true,
                              onChanged: (val) {},
                              style: TextStyle(letterSpacing: 3),
                              decoration: new InputDecoration(
                                hintText: 'Contraseña',
                                hintStyle: TextStyle(
                                  letterSpacing: 0,
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Por favor, crea una contraseña';
                                }
                                RegExp regex = new RegExp(r'.{8,}');
                                if (!regex.hasMatch(value)) {
                                  return 'La contraseña debe tener 8 caracteres o más';
                                }
                                return null;
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BackgroundContainer extends StatelessWidget {
  final double width, height;
  BackgroundContainer({
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.6,
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        image: DecorationImage(
          image: AssetImage(
            "assets/images/login11.jpeg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 60,
        ),
        child: Text(
          "Artemisa",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class FloatingButton extends StatelessWidget {
  final double width, height;
  FloatingButton({
    this.width,
    this.height,
  });
  AuthModel authModel;
  LoadingModel loadingModel;
  @override
  Widget build(BuildContext context) {
        authModel = Provider.of<AuthModel>(context);
    loadingModel = Provider.of<LoadingModel>(context);
    return Positioned(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
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
              onTap: () async {
                if (_formKey.currentState.validate()) {
                  loadingModel.loading = true;
                  User usuario = User(
                    email: "a",
                    gender: "m",
                    language: "es",
                    lastname: "r",
                    name: "r",
                    password: "a",
                    passwordConfirmation: "a",
                  );
                  User registeredUser = await authModel.registerUser(usuario);
                  authModel.token = "newToken";
                  authModel.user = registeredUser;
                  loadingModel.loading = false;
                }
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
    );
  }
}
