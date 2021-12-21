import 'package:flutter/material.dart';

class DisplayPhoto extends StatelessWidget {
  final String url ;
  final double width ;
  final double height ;

  DisplayPhoto({
    required this.url,
    required this.width,
    required this.height});

  @override
  Widget build(BuildContext context) {
    if(url == null){
      return Image.asset(
        'assets/account.png',
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    }else{
      return Image.network(
        url,
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    }
  }
}