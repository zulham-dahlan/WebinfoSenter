
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webinfo_senter/data/firebase/auth_service.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/ui/layout_navigation.dart';
import 'package:webinfo_senter/ui/register_page.dart';


class LoginPage extends StatefulWidget {
  static const routeName = '/login_page';

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool _isObscure = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    double widthButton, heightButton;

    if (MediaQuery.of(context).orientation == Orientation.landscape){
      widthButton = MediaQuery.of(context).size.height * 0.933;
      heightButton = MediaQuery.of(context).size.height * 0.145;
    }
    else{
      widthButton = MediaQuery.of(context).size.width * 0.933;
      heightButton = MediaQuery.of(context).size.width *0.145;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Container(child: Image.asset('assets/woman-working-at-home.png'),padding: const EdgeInsets.all(20),),
                  margin: const EdgeInsets.only(
                      top: 12, right: 12, left: 12, bottom: 21),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left:12,bottom: 9),
                  child: Text('Email',style: stylePoppinsGrey),
                ),
                Container(
                  margin: EdgeInsets.only(left: 12,right: 12,bottom: 21),
                  child: TextField(
                    controller: _emailController,
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
                    controller: _passwordController,
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
                  child: Container(
                    width: widthButton,
                    height: heightButton,
                    child: ElevatedButton(
                      onPressed: () {
                        AuthServices.lognIn(_emailController.text, _passwordController.text, context);
                      },
                      child: Text("Masuk",style: stylePoppinsWhite,),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),)),
                        backgroundColor:
                        MaterialStateProperty.all(customRedColor),
                        padding: MaterialStateProperty.all(EdgeInsets.only(
                            right: 153, left: 153, top: 22, bottom: 22)),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left:12,bottom: 9),
                  child: Text('Atau',style: stylePoppinsGrey),
                ),
                Container(
                  margin: EdgeInsets.only(right: 12, left: 12, bottom: 9),
                  child: Container(
                    width: widthButton,
                    height: heightButton,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterPage.routeName);
                      },
                      child: Text("Kuy Gabung",style: stylePoppinsBlack,),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: customGreyLight))),
                        backgroundColor:
                        MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(EdgeInsets.only(
                            right: 135, left: 135, top: 22, bottom: 22)),
                      ),
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


