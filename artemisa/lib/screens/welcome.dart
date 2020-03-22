import 'package:Artemisa/util/welcome_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Artemisa/stack/welcome_widgets.dart';
class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  final int _numPages = 3;
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              stops: [0.1, 0.5],
              colors: [
                Theme.of(context).primaryColorLight,
                Theme.of(context).primaryColor,
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _pageController.jumpToPage(3);
                      });
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.67,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      PageWidget(content: paginas[0]),
                      PageWidget(content: paginas[1]),
                      PageWidget(content: paginas[2]),
                    ],
                  ),
                ),
                PageIndicatorWidget(numPages: _numPages, currentPage: _currentPage),
                _currentPage != _numPages - 1
                    ? BottomRowWidget(pageController: _pageController)
                    : Text(""),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: BottomSheetWidget(currentPage: _currentPage, numPages: _numPages),
    );
  }
}
