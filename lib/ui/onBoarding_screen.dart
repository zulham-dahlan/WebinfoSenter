import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/ui/onBoarding2_screen.dart';

class OnBoarding extends StatelessWidget {
  static const routeName = '/on_boarding';

  OnBoarding({Key? key}) : super(key: key);

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
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/back_icon.png',color: Colors.white,),
                  ],
                ),
                Container(
                  child: Image.asset('assets/girls-gathering.png'),
                  margin: const EdgeInsets.only(
                      top: 48, right: 12, left: 12, bottom: 84),
                  padding: const EdgeInsets.all(20),
                ),
                Text(
                  "Webinar dari rumah\nhadir online bareng family",
                  style: styleRoboto,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 6),
                Text(
                  "Ikut webinar makin gampang\npake Webinfo Senter",
                  style: styleMontserrat,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 48),
                Container(
                  margin: EdgeInsets.only(right: 60,left: 60,bottom: 70),
                  child: Container(
                    width: widthButton,
                    height: heightButton,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          OnBoarding2.routeName
                        );
                      },
                      child: Text("Gass!!",style: stylePoppinsWhite),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                              )
                          ),
                          backgroundColor: MaterialStateProperty.all(customRedColor),)
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
