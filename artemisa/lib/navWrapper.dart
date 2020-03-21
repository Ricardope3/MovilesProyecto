import 'package:artemisa/screens/bookings.dart';
import 'package:artemisa/screens/chats.dart';
import 'package:artemisa/screens/home.dart';
import 'package:artemisa/screens/profile.dart';
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
            title: Text(''),
            icon: Icon(FontAwesomeIcons.home), // HOME
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(FontAwesomeIcons.book), // BOOKINGS
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(FontAwesomeIcons.commentDots), // CHATS
          ),
          BottomNavigationBarItem(
            title: Text(''),
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