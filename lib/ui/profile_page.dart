import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/data/firebase/firestore_service.dart';
import 'package:webinfo_senter/data/model/akun.dart';
import 'package:webinfo_senter/ui/onBoarding2_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
<<<<<<< HEAD
import 'package:webinfo_senter/widget/display_photo.dart';
=======
import 'package:webinfo_senter/ui/setting_page.dart';
>>>>>>> 302632c9bab80555ffa1e2ebc42bc0e15f7860da

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
                      Text('Akun', style: styleRobotoTitle,),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context,
                                SettingPage.routeName
                            );
                          }, icon: Icon(Icons.settings))
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  FutureBuilder<Akun>(
                    future:FirestoreService.readData(),
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        var profileAkun = snapshot.data!;
                        return Column(
                          children: [
                            ClipOval(
                              child: DisplayPhoto(url: profileAkun.urlFotoProfil,width: 150.0, height: 150.0,),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              child: Text(profileAkun.nama,style: styleMontserratName,),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(profileAkun.email,style: styleMontserratTitle),
                          ],
                        );
                      }else{
                        return Text('Something Wrong');
                      }
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: widthButton,
                    height: heightButton,
                    child: OutlinedButton(  
                      onPressed: () {
                       
                      },
                      child: Text("Ubah Profile",style: stylePoppinsBlack),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: widthButton,
                    height: heightButton,
                    child: OutlinedButton(  
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      child: Text("Keluar Ah..",style: stylePoppinsBlack),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
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
