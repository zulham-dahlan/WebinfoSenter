import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/ui/home_page.dart';
import 'package:webinfo_senter/ui/webinarku_page.dart';
import 'package:webinfo_senter/ui/profile_page.dart';

class LayoutNavigation extends StatefulWidget {
  static const routeName = '/layout_navigation';

  const LayoutNavigation({Key? key}) : super(key: key);

  @override
  _LayoutNavigation createState() => _LayoutNavigation();
}

class _LayoutNavigation extends State<LayoutNavigation> {
  int _bottomNavIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(color: customRedColor),
        selectedItemColor: customRedColor,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        currentIndex: _bottomNavIndex,
        items : _bottomNavBarItems,
        onTap:_onBottomNavTapped,
      ),
    );
  }

  final List<Widget> _listWidget = [
    const HomePage(),
    const WebinarkuPage(),
    const ProfilePage(),
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: HomePage.homeTitle,
    ),
     const BottomNavigationBarItem(
      icon: Icon(Icons.book),
      label: WebinarkuPage.webinarkuTitle,
    ),
     const BottomNavigationBarItem(
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
