import 'package:flutter/material.dart';

Widget indicator(bool isActive, BuildContext context) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: 8),
    height: 8,
    width: isActive ? 24 : 16,
    decoration: BoxDecoration(
      color: isActive ? Colors.white : Theme.of(context).primaryColorLight,
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    ),
  );
}

List<Widget> buildPageIndicator(int _numPages, int _currentPage, BuildContext context) {
  List<Widget> list = [];
  for (var i = 0; i < _numPages; i++) {
    list.add(
      i == _currentPage
          ? indicator(true, context)
          : indicator(false, context),
    );
  }
  return list;
}

class PageWidget extends StatelessWidget {
  final Map content;
  PageWidget({this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image.asset(content["image"]),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            content["title"],
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.1,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            content["subtitle"],
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}


class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    Key key,
    @required int currentPage,
    @required int numPages,
  }) : _currentPage = currentPage, _numPages = numPages, super(key: key);

  final int _currentPage;
  final int _numPages;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: _currentPage == _numPages - 1
          ? MediaQuery.of(context).size.height * 0.15
          : 0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment(0, 3),
        ),
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, "/login");
            },
            child: Text(
              "Crear cuenta",
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, "/navWrapper");
            },
            child: Text(
              "Continuar sin cuenta",
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          )
        ],
      )),
    );
  }
}

class BottomRowWidget extends StatelessWidget {
  const BottomRowWidget({
    Key key,
    @required PageController pageController,
  }) : _pageController = pageController, super(key: key);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Align(
          alignment: FractionalOffset.bottomRight,
          child: FlatButton(
            onPressed: () {
              _pageController.nextPage(
                duration: Duration(
                  milliseconds: 300,
                ),
                curve: Curves.ease,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 25,
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({
    Key key,
    @required int numPages,
    @required int currentPage,
  }) : _numPages = numPages, _currentPage = currentPage, super(key: key);

  final int _numPages;
  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buildPageIndicator(_numPages,_currentPage,context),
    );
  }
}


