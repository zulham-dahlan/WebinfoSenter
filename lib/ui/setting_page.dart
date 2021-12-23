import 'package:flutter/material.dart';
import 'package:webinfo_senter/ui/home.dart';
import 'home.dart';


class SettingPage extends StatelessWidget {
  static const routeName = '/setting_page';

  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20, decoration: TextDecoration.underline),
                  ),
                  onPressed: (){
                    Navigator.pushNamed(
                        context,
                        HomePage2.routeName
                    );
                  },
                  child: const Text('Ubah PassWord!!'),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
