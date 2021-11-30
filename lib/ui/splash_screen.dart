import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webinfo_senter/ui/onBoarding_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => OnBoarding(title: 'WebinfoSenter',))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Image.asset('assets/man-working-from-home.png'),
      padding: EdgeInsets.symmetric(horizontal: 25),
    );
  }
}