import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/ui/home_page.dart';
import 'package:webinfo_senter/ui/webinarku_page.dart';
import 'package:webinfo_senter/ui/profile_page.dart';

class LayoutNavigation extends StatefulWidget {
  static const routeName = '/layout_navigation';

  @override
  _LayoutNavigation createState() => _LayoutNavigation();
}

class _LayoutNavigation extends State<LayoutNavigation> {
  int _bottomNavIndex = 0 ;
  static const routeName = '/layout_navigation';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: customRedColor),
        selectedItemColor: customRedColor,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        currentIndex: _bottomNavIndex,
        items : _bottomNavBarItems,
        onTap:_onBottomNavTapped,
      ),
    );
  }

  List<Widget> _listWidget = [
    HomePage(),
    WebinarkuPage(),
    ProfilePage(),
  ];

  List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: HomePage.homeTitle,
    ),
     BottomNavigationBarItem(
      icon: Icon(Icons.book),
      label: WebinarkuPage.webinarkuTitle,
    ),
     BottomNavigationBarItem(
      icon: Icon(Icons.account_box),
      label: ProfilePage.profileTitle,
    ),
  ];

  void _onBottomNavTapped(int index){
    setState((){
      _bottomNavIndex = index;
    });
  }
}
