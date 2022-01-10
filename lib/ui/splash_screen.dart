import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webinfo_senter/data/firebase/auth_service.dart';
import 'package:webinfo_senter/ui/introduction_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash_screen';
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      // Navigator.pushReplacementNamed(context, IntroductionScreen.routeName);
       AuthServices.toLoginorHome(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child:
                Image.asset('assets/splash_logo.png', width: 250, height: 250),
          ),
        ],
      ),
    );
  }
}
