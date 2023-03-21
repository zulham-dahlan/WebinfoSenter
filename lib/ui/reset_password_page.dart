import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/common/text_theme.dart';
import 'package:webinfo_senter/data/firebase/auth_service.dart';

class ResetPasswordPage extends StatefulWidget {
  static const routeName = '/reset_password';
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
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
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Reset Password',
                style: myTextTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Masukan email yang terhubung dengan akun webinfo senter anda, kami akan mengirimkan email untuk melakukan reset password.',
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
                height: 10,
              ),
              SizedBox(
                width: widthButton,
                height: heightButton,
                child: ElevatedButton(
                  onPressed: () {
                    AuthServices.resetPassword(_emailController.text, context);
                  },
                  child: Text(
                    "Kirim",
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
            ],
          ),
        ),
      ),
    );
  }
}
