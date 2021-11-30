import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  static const String profilTitle = 'Profil';
  static const routeName = '/profil_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Profil Page'),
      ),
    );
  }
}