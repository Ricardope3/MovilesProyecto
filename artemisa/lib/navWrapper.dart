import 'package:Artemisa/screens/bookings.dart';
import 'package:Artemisa/screens/chats.dart';
import 'package:Artemisa/screens/home.dart';
import 'package:Artemisa/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavWrapper extends StatefulWidget {

  @override
  _NavWrapperState createState() => _NavWrapperState();
}

class _NavWrapperState extends State<NavWrapper> {
  final List<Widget> _screens = [Home(), Bookings(), Chats(), Profile()];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon: Icon(FontAwesomeIcons.home), // HOME
          ),
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon: Icon(FontAwesomeIcons.book), // BOOKINGS
          ),
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon: Icon(FontAwesomeIcons.commentDots), // CHATS
          ),
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon: Icon(FontAwesomeIcons.user), // PROFILE
          ),
        ],
        onTap: (int newIndex) {
          setState(() {
            _index = newIndex;
          });
        },
      ),
    );
  }
}