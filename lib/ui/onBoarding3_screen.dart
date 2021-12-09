import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/ui/login_page.dart';

class OnBoarding3 extends StatelessWidget {
  static const routeName = '/on_boarding3';

  OnBoarding3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  child: Image.asset('assets/guy-on-bike.png'),
                  margin: const EdgeInsets.only(
                      top: 48, right: 12, left: 12, bottom: 108),
                  padding: const EdgeInsets.all(20),
                ),
                Text(
                  "Yuk gabung kita sekarang!",
                  style: styleRoboto,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 73),
                Container(
                  margin: EdgeInsets.only(right: 40,left: 40,bottom: 65),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginPage.routeName);
                    },
                    child: Text("Yuk Cuss",style: stylePoppinsWhite,),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),)),
                      backgroundColor:
                      MaterialStateProperty.all(customRedColor),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: widthScreen*0.16  , vertical: widthScreen*0.045)),

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
