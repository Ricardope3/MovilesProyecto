import 'package:flutter/material.dart';

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
        ],
      ),
    );
  }
}

class RegisterFormWidget extends StatelessWidget {
  final double width, height;
  RegisterFormWidget({this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: height * 0.5,
      child: Container(
        height: height * 0.5,
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
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/home',
                          ModalRoute.withName('/login'),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(
                        child: Form(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextFormField(
                                onChanged: (val) {},
                                decoration: new InputDecoration(
                                  hintText: 'Nombre',
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                onChanged: (val) {},
                                decoration: new InputDecoration(
                                  hintText: 'Apellido',
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (val) {},
                                decoration: new InputDecoration(
                                  hintText: 'E-mail',
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                obscureText: true,
                                onChanged: (val) {},
                                style: TextStyle(letterSpacing: 7),
                                decoration: new InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
            "assets/images/login10.jpeg",
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
