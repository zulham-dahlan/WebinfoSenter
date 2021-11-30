import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/color_palette.dart';
import 'package:webinfo_senter/ui/layout_navigation.dart';
import 'package:webinfo_senter/ui/onBoarding3_screen.dart';

class OnBoarding3 extends StatelessWidget {
  static const routeName = '/on_boarding3';

  OnBoarding3({Key? key}) : super(key: key);

  var styleRoboto = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: 'Roboto',
  );
  var styleMontserrat = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontFamily: 'Montserrat',
  );
  var stylePoppins = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontFamily: 'Poppins',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  child: Image.asset('assets/man-working-from-home.png'),
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
                      Navigator.pushReplacementNamed(context, LayoutNavigation.routeName);
                    },
                    child: Text("Yuk Cuss"),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              side: BorderSide(color: Colors.red))),
                      backgroundColor:
                      MaterialStateProperty.all(ColorPalette.customRedColor),
                      padding: MaterialStateProperty.all(EdgeInsets.only(
                          right: 110, left: 109, top: 21, bottom: 21)),
                      textStyle: MaterialStateProperty.all(stylePoppins),
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
