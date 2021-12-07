import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/ui/onBoarding2_screen.dart';

class ProfilePage extends StatelessWidget {
  static const String profileTitle = 'Profile';
  static const routeName = '/profile_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){}, icon: Image.asset('assets/back_png.png'),),
                    Text('Akun', style: styleRobotoTitle,),
                    IconButton(onPressed: (){}, icon: Image.asset('assets/back_png.png'),)
                  ],
                ),
                Container(
                  child: Image.asset('assets/ahmad_dahlan.png'),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  child: Text('Ahmad Dahlan',style: styleMontserratTitle,),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Text('Kegiatanku',style: styleMontserratTitle,),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.only(right: 60,left: 60,bottom: 70),
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
                      backgroundColor: MaterialStateProperty.all(customRedColor),
                      padding: MaterialStateProperty.all(EdgeInsets.only(right: 101,left: 101,top: 16,bottom: 16)),),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
