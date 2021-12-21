import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/data/firebase/auth_service.dart';
import 'package:webinfo_senter/data/model/akun.dart';

class AppHeader extends StatelessWidget {
  final Akun akun;

  AppHeader(this.akun);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/ahmad_dahlan.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: styleMontserrat,
                  ),
                  Text(
                    akun.nama,
                    style: styleRoboto,
                  ),
                ],
              )
            ],
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: customRedLight,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none_outlined),
            ),
          )
        ],
      ),
    );
  }
}
