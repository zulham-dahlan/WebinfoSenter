import 'package:flutter/material.dart';
import 'package:webinfo_senter/home_page.dart';
import 'package:webinfo_senter/layout_navigation.dart';
import 'package:webinfo_senter/profil_page.dart';
import 'package:webinfo_senter/webinarku_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webinfo Senter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LayoutNavigation.routeName,
      routes: {
        LayoutNavigation.routeName: (context) => LayoutNavigation(),
        HomePage.routeName: (context) => HomePage(),
        WebinarkuPage.routeName: (context) => WebinarkuPage(),
        ProfilPage.routeName: (context) => ProfilPage(),
      },
    );
  }
}