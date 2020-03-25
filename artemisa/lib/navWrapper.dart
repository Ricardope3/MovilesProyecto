import 'package:Artemisa/landlord/screens/bookings.dart';
import 'package:Artemisa/landlord/screens/chats.dart';
import 'package:Artemisa/landlord/screens/home.dart';
import 'package:Artemisa/landlord/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandlordNavWrapper extends StatefulWidget {

  @override
  _LandlordNavWrapperState createState() => _LandlordNavWrapperState();
}

class _LandlordNavWrapperState extends State<LandlordNavWrapper> {
  final List<Widget> _screens = [Home(), Bookings(), Chats(), Profile()];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        elevation: 0,
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