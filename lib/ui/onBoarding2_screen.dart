import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/ui/onBoarding3_screen.dart';

class OnBoarding2 extends StatelessWidget {
  static const routeName = '/on_boarding2';

  OnBoarding2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  child: Image.asset('assets/man-working-from-home.png'),
                  margin: const EdgeInsets.only(
                      top: 48, right: 12, left: 12, bottom: 84),
                  padding: const EdgeInsets.all(20),
                ),
                Text(
                  "Tentuin jadwal senggang\nbuat join dari rumah",
                  style: styleRoboto,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 6),
                Text(
                  "Makin produktif sama waktu fleksibel\nasikin di rumah pake Webinfo Senter",
                  style: styleMontserrat,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 45),
                Container(
                  margin: EdgeInsets.only(right: 50,left: 50,bottom: 68),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        OnBoarding3.routeName
                      );
                    },
                    child: Text("Gass!!",style: stylePoppinsWhite),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),)),
                      backgroundColor:
                          MaterialStateProperty.all(customRedColor),
                      padding: MaterialStateProperty.all(EdgeInsets.only(
                          right: 111, left: 111, top: 19, bottom: 18)),
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
