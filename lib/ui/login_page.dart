import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/text_theme.dart';
import 'package:webinfo_senter/data/firebase/auth_service.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/ui/register_page.dart';
import 'package:webinfo_senter/ui/reset_password_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login_page';

  const LoginPage({Key? key}) : super(key: key);

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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                style: myTextTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Login to get webinar information',
                style: myTextTheme.bodyLarge,
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'username@gmail.com',
                  labelText: 'Email',
                  labelStyle: myTextTheme.bodyLarge,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: myTextTheme.bodyLarge,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      }),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: widthButton,
                height: heightButton,
                child: ElevatedButton(
                  onPressed: () {
                    AuthServices.lognIn(_emailController.text,
                        _passwordController.text, context);
                  },
                  child: Text(
                    "Login",
                    style: myTextTheme.labelLarge,
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                    backgroundColor: MaterialStateProperty.all(customRedColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ResetPasswordPage.routeName);
                  },
                  child: Text('Lupa password ?',
                      style: myTextTheme.bodyLarge!.copyWith(
                        color: customBlueDark,
                      )),
                ),
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Belum Punya Akun?',
                      style:
                          myTextTheme.bodyLarge!.copyWith(color: Colors.grey)),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: widthButton,
                    height: heightButton,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterPage.routeName);
                      },
                      child: Text('Daftar Webinfo Senter',
                          style: myTextTheme.labelLarge!
                              .copyWith(color: Colors.black)),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(
                                        color: customGreyLight))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
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
