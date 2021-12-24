
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webinfo_senter/data/firebase/auth_service.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/data/model/akun.dart';
import 'package:webinfo_senter/data/firebase/firestore_service.dart';
import 'package:webinfo_senter/ui/layout_navigation.dart';
import 'package:webinfo_senter/ui/login_page.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register_page';

  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  bool _isObscure = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  child: Text('Nama',style: stylePoppins.copyWith(fontWeight: FontWeight.bold, color: customGreyLight,)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 12,right: 12,bottom: 21),
                  child: TextField(
                    controller: _fullnameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nama Lengkap',labelStyle: stylePoppins.copyWith(fontWeight: FontWeight.bold, color: customGreyLight,),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left:12,bottom: 9),
                  child: Text('Email',style: stylePoppins.copyWith(fontWeight: FontWeight.bold, color: customGreyLight,)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 12,right: 12,bottom: 21),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'username@gmail.com',labelStyle: stylePoppins.copyWith(fontWeight: FontWeight.bold, color: customGreyLight,),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left:12,bottom: 10),
                  child: Text('Password',style: stylePoppins.copyWith(fontWeight: FontWeight.bold, color: customGreyLight,)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 12,right: 12,bottom: 18),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                        hintText: 'Password',labelStyle: stylePoppins.copyWith(fontWeight: FontWeight.bold, color: customGreyLight,),
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
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, LayoutNavigation.routeName);
                    },
                    child: Text('Lupa Password Nih?',style: styleRoboto.copyWith(fontSize: 12, color: customBlueDark,)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 12, left: 12, top:9, bottom: 9),
                  child: ElevatedButton(
                    onPressed: () {
                      String email = _emailController.text;
                      String password =  _passwordController.text;
                      String namalengkap = _fullnameController.text;
                      Akun daftarAkun = Akun(nama: namalengkap,email: email, urlFotoProfil: "", bookmark: [],publish: []);
                      AuthServices.register(daftarAkun,password, context);
                    },
                    child: Text("Gas Gabung",style: stylePoppins.copyWith(color: Colors.white,),),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),)),
                      backgroundColor:
                      MaterialStateProperty.all(customRedColor),
                      padding: MaterialStateProperty.all(EdgeInsets.only(
                          right: 135, left: 135, top: 22, bottom: 22)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 12, left: 12, bottom: 9),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginPage.routeName);
                    },
                    child: Text("Udah Gabung Sii...",style: stylePoppins,),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: customGreyLight))),
                      backgroundColor:
                      MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(EdgeInsets.only(
                          right: 119, left: 119, top: 22, bottom: 22)),
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


