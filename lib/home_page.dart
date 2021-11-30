import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String homeTitle = 'Home';
  static const routeName = '/home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}