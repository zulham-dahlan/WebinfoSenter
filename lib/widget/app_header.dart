import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/data/model/akun.dart';
import 'package:webinfo_senter/widget/display_photo.dart';

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
                child: DisplayPhoto(url : akun.urlFotoProfil, width: 50.0, height: 50.0,),
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

