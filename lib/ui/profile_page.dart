import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/ui/onBoarding2_screen.dart';

class ProfilePage extends StatelessWidget {
  static const String profileTitle = 'Profile';
  static const routeName = '/profile_page';

  @override
  Widget build(BuildContext context) {
    double widthButton, heightButton;

    if (MediaQuery.of(context).orientation == Orientation.landscape){
      widthButton = MediaQuery.of(context).size.height * 0.933;
      heightButton = MediaQuery.of(context).size.height * 0.145;
    }
    else{
      widthButton = MediaQuery.of(context).size.width * 0.933;
      heightButton = MediaQuery.of(context).size.width *0.145;
    }
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
                      Image.asset('assets/back_icon.png',color: Colors.white,),
                      Text('Akun', style: styleRobotoTitle,),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.settings))
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
                    margin: EdgeInsets.only(bottom: 70),
                    child: Container(
                      width: widthButton,
                      height: heightButton,
                      child: OutlinedButton(
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
                          padding: MaterialStateProperty.all(EdgeInsets.only(right: 80,left: 80,top: 8,bottom: 8)),),
                      ),
                    ),
                  ),

                ],
              ),
            )),
      ),
    );
  }
}
