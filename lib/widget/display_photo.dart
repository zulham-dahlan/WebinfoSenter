import 'package:flutter/material.dart';

class DisplayPhoto extends StatelessWidget {
  final String url;
  final double width;
  final double height;

  const DisplayPhoto({Key? key, required this.url, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var urlFoto = url ;
    return urlFoto.isEmpty
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
