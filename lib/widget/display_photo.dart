import 'package:flutter/material.dart';

class DisplayPhoto extends StatelessWidget {
  final String? url;
  final double width;
  final double height;

  DisplayPhoto({required this.url, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    var urlFoto = url ;
    return urlFoto == null
        ? Image.asset(
            'assets/account.png',
            width: width,
            height: height,
            fit: BoxFit.cover,
          )
        : Image.network(
            urlFoto,
            width: width,
            height: height,
            fit: BoxFit.cover,
          );
  }
}
