import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/ui/onBoarding3_screen.dart';

class OnBoarding2 extends StatelessWidget {
  static const routeName = '/on_boarding2';

  OnBoarding2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthButton, heightButton;

    if (MediaQuery.of(context).orientation == Orientation.landscape){
      widthButton = MediaQuery.of(context).size.height * 0.38;
      heightButton = MediaQuery.of(context).size.height * 0.12;
    }
    else{
      widthButton = MediaQuery.of(context).size.width * 0.38;
      heightButton = MediaQuery.of(context).size.width *0.12;
    }

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
                  child: Container(
                    width: widthButton,
                    height: heightButton,
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
