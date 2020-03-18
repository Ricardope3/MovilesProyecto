import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContentView extends StatelessWidget{

  final Widget content;

  ContentView({ this.content });

  build(BuildContext context) {
    return Scaffold(
      body: this.content,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem> [
          CustomNavBarItem(
            icon: Icon(FontAwesomeIcons.home),
            route: 'test'
          ),
          CustomNavBarItem(
            icon: Icon(FontAwesomeIcons.book),
            route: 'test2'
          ),
          CustomNavBarItem(
            icon: Icon(FontAwesomeIcons.commentDots),
            route: 'test3'
          ),
          CustomNavBarItem(
            icon: Icon(FontAwesomeIcons.user),
            route: 'test4'
          ),
        ],
      )
    );
  }
}

class CustomNavBarItem extends BottomNavigationBarItem {
  CustomNavBarItem({ Icon icon, String route }) : super(
    title: Text(''),
    icon: IconButton(
      icon: icon,
      onPressed: () {
        print(route);
      }
    )
  );
}