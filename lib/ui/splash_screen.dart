import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/ui/onBoarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash_screen';
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
        () => Navigator.pushReplacementNamed(context, OnBoarding.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: customRedDark,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child:
                Image.asset('assets/webinfo_logo.png', width: 96, height: 96),
          ),
        ],
      ),
    );
  }
}
