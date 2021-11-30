import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/color_palette.dart';
import 'package:webinfo_senter/ui/onBoarding3_screen.dart';

class OnBoarding2 extends StatelessWidget {
  OnBoarding2({Key? key}) : super(key: key);

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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnBoarding3()),
                      );
                    },
                    child: Text("Gass!!"),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              side: BorderSide(color: Colors.red))),
                      backgroundColor:
                          MaterialStateProperty.all(ColorPalette.customRedColor),
                      padding: MaterialStateProperty.all(EdgeInsets.only(
                          right: 111, left: 111, top: 19, bottom: 18)),
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
