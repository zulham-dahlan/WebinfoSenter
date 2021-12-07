import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/ui/onBoarding2_screen.dart';

class ProfilePage extends StatelessWidget {
  static const String profileTitle = 'Profile';
  static const routeName = '/profile_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child:Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){}, icon: Image.asset('assets/back_icon.png'),),
                      Text('Akun', style: styleRobotoTitle,),
                      IconButton(onPressed: (){}, icon: Image.asset('assets/back_icon.png'),)
                    ],
                  ),
                  Container(
                    child: ClipOval(
                      child: Image.asset(
                        'assets/ahmad_dahlan.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    child: Text('Ahmad Dahlan',style: styleMontserratName,),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left:12,bottom: 9),
                    child: Text('Email',style: styleMontserratTitle),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left:12,bottom: 9),
                    child: Text('user@username.com',style: styleMontserratTitle),
                  ),
                  SizedBox(
                    height: 24,
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
                      child: Column(
                        children: [
                          Icon(Icons.email, color: Colors.blue,),
                          Text("Ubah Profile",style: stylePoppinsBlack),
                        ],
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            )
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(EdgeInsets.only(right: 101,left: 101,top: 16,bottom: 16)),),
                    ),
                  ),

                ],
              ),
            )),
      ),
    );
  }
}
