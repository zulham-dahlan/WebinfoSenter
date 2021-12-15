import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/auth_service.dart';
import 'package:webinfo_senter/common/style.dart';

class OnBoarding3 extends StatelessWidget {
  static const routeName = '/on_boarding3';

  OnBoarding3({Key? key}) : super(key: key);

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
                  child: Container(
                    width: widthButton,
                    height: heightButton,
                    child: ElevatedButton(
                      onPressed: () {
                        AuthServices.toLoginorHome(context);
                      },
                      child: Text("Yuk Cuss",style: stylePoppinsWhite,),
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
