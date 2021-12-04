import 'package:flutter/material.dart';
import 'package:webinfo_senter/ui/home_page.dart';
import 'package:webinfo_senter/ui/layout_navigation.dart';
import 'package:webinfo_senter/ui/onBoarding2_screen.dart';
import 'package:webinfo_senter/ui/onBoarding3_screen.dart';
import 'package:webinfo_senter/ui/onBoarding_screen.dart';
import 'package:webinfo_senter/ui/profil_page.dart';
import 'package:webinfo_senter/ui/search_screen.dart';
import 'package:webinfo_senter/ui/webinarku_page.dart';
import 'package:webinfo_senter/ui/splash_screen.dart';

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
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        OnBoarding.routeName: (context) => OnBoarding(),
        OnBoarding2.routeName: (context) => OnBoarding2(),
        OnBoarding3.routeName: (context) => OnBoarding3(),
        LayoutNavigation.routeName: (context) => LayoutNavigation(),
        HomePage.routeName: (context) => HomePage(),
        WebinarkuPage.routeName: (context) => WebinarkuPage(),
        ProfilPage.routeName: (context) => ProfilPage(),
        SearchScreen.routeName : (context) => SearchScreen(name: ModalRoute.of(context)?.settings.arguments as String),
      },
    );
  }
}

