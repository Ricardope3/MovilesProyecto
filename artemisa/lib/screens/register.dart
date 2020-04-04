import 'package:Artemisa/models/loading.dart';
import 'package:Artemisa/stack/register_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (_) => LoadingModel(),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: RegisterBuilder(),
      ),
    );
  }
}

class RegisterBuilder extends StatelessWidget {
  RegisterBuilder();
  LoadingModel loadingModel;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    loadingModel = Provider.of<LoadingModel>(context);
    return Container(
      child: !loadingModel.loading
          ? buildRegisterWidget(height, width)
          : buildRegisteringWidget(context),
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
