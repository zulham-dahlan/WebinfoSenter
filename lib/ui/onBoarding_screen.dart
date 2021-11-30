import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  color: Colors.blue,
                  child: Image.asset('assets/man-working-from-home.png'),
                  margin: EdgeInsets.only(top:48,right: 12,left: 12,bottom: 84),
                  padding: EdgeInsets.all(20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
