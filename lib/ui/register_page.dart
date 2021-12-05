
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/ui/layout_navigation.dart';
import 'package:webinfo_senter/ui/login_page.dart';






class RegisterPage extends StatefulWidget {
  static const routeName = '/register_page';

  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top:13,left:12,bottom: 16),
                  child: Text('Sign Up',style: styleRoboto),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left:12,bottom: 9),
                  child: Text('Nama',style: stylePoppinsGrey),
                ),
                Container(
                  margin: EdgeInsets.only(left: 12,right: 12,bottom: 21),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nama Lengkap',labelStyle: stylePoppinsGrey,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left:12,bottom: 9),
                  child: Text('Email',style: stylePoppinsGrey),
                ),
                Container(
                  margin: EdgeInsets.only(left: 12,right: 12,bottom: 21),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'username@gmail.com',labelStyle: stylePoppinsGrey,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left:12,bottom: 10),
                  child: Text('Password',style: stylePoppinsGrey),
                ),
                Container(
                  margin: EdgeInsets.only(left: 12,right: 12,bottom: 18),
                  child: TextField(
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                        hintText: 'Password',labelStyle: stylePoppinsGrey,
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                            icon: Icon(
                                _isObscure ? Icons.visibility : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            })),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 12),
                  child:           TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, LayoutNavigation.routeName);
                    },
                    child: Text('Lupa Password Nih?',style: styleRobotoBlue),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 12, left: 12, top:9, bottom: 9),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LayoutNavigation.routeName);
                    },
                    child: Text("Gas Gabung",style: stylePoppinsWhite,),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),)),
                      backgroundColor:
                      MaterialStateProperty.all(customRedColor),
                      padding: MaterialStateProperty.all(EdgeInsets.only(
                          right: 155, left: 155, top: 22, bottom: 22)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 12, left: 12, bottom: 9),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginPage.routeName);
                    },
                    child: Text("Udah Gabung Sii...",style: stylePoppinsBlack,),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: customGreyLight))),
                      backgroundColor:
                      MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(EdgeInsets.only(
                          right: 139, left: 139, top: 22, bottom: 22)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

