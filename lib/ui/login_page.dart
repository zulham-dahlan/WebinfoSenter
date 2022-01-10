import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/text_theme.dart';
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

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      widthButton = MediaQuery.of(context).size.height * 0.933;
      heightButton = MediaQuery.of(context).size.height * 0.145;
    } else {
      widthButton = MediaQuery.of(context).size.width * 0.933;
      heightButton = MediaQuery.of(context).size.width * 0.145;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/logo.png',
                    width: 180,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Login',
                  style: myTextTheme.headline4!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Login to get webinar information',
                  style: myTextTheme.bodyText1,
                ),
                SizedBox(
                  height: 25,
                ),

                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'username@gmail.com',
                    labelText: 'Email',
                    labelStyle: myTextTheme.bodyText1,
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    labelStyle: myTextTheme.bodyText1,
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Container(
                  width: widthButton,
                  height: heightButton,
                  child: ElevatedButton(
                    onPressed: () {
                      AuthServices.lognIn(_emailController.text,
                          _passwordController.text, context);
                    },
                    child: Text(
                      "Login",
                      style: myTextTheme.button,
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      backgroundColor:
                          MaterialStateProperty.all(customRedColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, LayoutNavigation.routeName);
                    },
                    child: Text('Lupa password ?',
                        style: myTextTheme.bodyText1!.copyWith(
                          color: customBlueDark,
                        )),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Belum Punya Akun?',
                        style: myTextTheme.bodyText1!
                            .copyWith(color: Colors.grey)),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: widthButton,
                      height: heightButton,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterPage.routeName);
                        },
                        child: Text('Daftar Webinfo Senter',
                            style: myTextTheme.button!
                                .copyWith(color: Colors.black)),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side:
                                          BorderSide(color: customGreyLight))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
                // Container(
                //   margin:
                //       EdgeInsets.only(right: 12, left: 12, top: 9, bottom: 9),
                //   child: Container(
                //     width: widthButton,
                //     height: heightButton,
                //     child: ElevatedButton(
                //       onPressed: () {
                //         AuthServices.lognIn(_emailController.text,
                //             _passwordController.text, context);
                //       },
                //       child: Text(
                //         "Masuk",
                //         style: stylePoppins.copyWith(
                //           color: Colors.white,
                //         ),
                //       ),
                //       style: ButtonStyle(
                //         shape:
                //             MaterialStateProperty.all<RoundedRectangleBorder>(
                //                 RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10.0),
                //         )),
                //         backgroundColor:
                //             MaterialStateProperty.all(customRedColor),
                //         padding: MaterialStateProperty.all(EdgeInsets.only(
                //             right: 153, left: 153, top: 22, bottom: 22)),
                //       ),
                //     ),
                //   ),
                // ),
                // Container(
                //   alignment: Alignment.center,
                //   margin: EdgeInsets.only(left: 12, bottom: 9),
                //   child: Text('Atau',
                //       style: stylePoppins.copyWith(
                //         fontWeight: FontWeight.bold,
                //         color: customGreyLight,
                //       )),
                // ),
                // Container(
                //   margin: EdgeInsets.only(right: 12, left: 12, bottom: 9),
                //   child: Container(
                //     width: widthButton,
                //     height: heightButton,
                //     child: ElevatedButton(
                //       onPressed: () {
                //         Navigator.pushNamed(context, RegisterPage.routeName);
                //       },
                //       child: Text("Kuy Gabung", style: stylePoppins),
                //       style: ButtonStyle(
                //         shape:
                //             MaterialStateProperty.all<RoundedRectangleBorder>(
                //                 RoundedRectangleBorder(
                //                     borderRadius: BorderRadius.circular(10.0),
                //                     side: BorderSide(color: customGreyLight))),
                //         backgroundColor:
                //             MaterialStateProperty.all(Colors.white),
                //         padding: MaterialStateProperty.all(EdgeInsets.only(
                //             right: 135, left: 135, top: 22, bottom: 22)),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
