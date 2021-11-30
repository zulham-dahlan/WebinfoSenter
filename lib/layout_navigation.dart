
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webinfo_senter/home_page.dart';
import 'package:webinfo_senter/profil_page.dart';
import 'package:webinfo_senter/webinarku_page.dart';

class LayoutNavigation extends StatefulWidget {
  static const routeName = '/layout_navigation';

  @override
  _LayoutNavigation createState() => _LayoutNavigation();
}

class _LayoutNavigation extends State<LayoutNavigation> {
  int _bottomNavIndex = 0 ;
  //static const String homeTitle = 'Home';
  static const routeName = '/layout_navigatiom';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink,
        selectedIconTheme: IconThemeData(color: Colors.white, size: 30),
        selectedItemColor: Colors.white,
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
    ProfilPage(),
  ];

  List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: HomePage.homeTitle,
    ),
     BottomNavigationBarItem(
      icon: Icon(Icons.book),
      label: WebinarkuPage.webinarkuTitle,
    ),
     BottomNavigationBarItem(
      icon: Icon(Icons.account_box_outlined),
      label: ProfilPage.profilTitle,
    ),
  ];

  void _onBottomNavTapped(int index){
    setState((){
      _bottomNavIndex = index;
    });
  }
}