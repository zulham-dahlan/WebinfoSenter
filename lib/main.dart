import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:webinfo_senter/data/webinar.dart';
import 'package:webinfo_senter/ui/allwebinar_screen.dart';
import 'package:webinfo_senter/ui/detail_screen.dart';
import 'package:webinfo_senter/ui/home_page.dart';
import 'package:webinfo_senter/ui/layout_navigation.dart';
import 'package:webinfo_senter/ui/login_page.dart';
import 'package:webinfo_senter/ui/onBoarding2_screen.dart';
import 'package:webinfo_senter/ui/onBoarding3_screen.dart';
import 'package:webinfo_senter/ui/onBoarding_screen.dart';
import 'package:webinfo_senter/ui/pengajuan_screen.dart';
import 'package:webinfo_senter/ui/profile_page.dart';
import 'package:webinfo_senter/ui/search_screen.dart';
import 'package:webinfo_senter/ui/register_page.dart';
import 'package:webinfo_senter/ui/webinarku_page.dart';
import 'package:webinfo_senter/ui/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Webinfo Senter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        OnBoarding.routeName: (context) => OnBoarding(),
        OnBoarding2.routeName: (context) => OnBoarding2(),
        OnBoarding3.routeName: (context) => OnBoarding3(),
        LayoutNavigation.routeName: (context) => LayoutNavigation(),
        HomePage.routeName: (context) => HomePage(),
        WebinarkuPage.routeName: (context) => WebinarkuPage(),
        ProfilePage.routeName: (context) => ProfilePage(),
        SearchScreen.routeName : (context) => SearchScreen(name: ModalRoute.of(context)?.settings.arguments as String),
        LoginPage.routeName: (context) => LoginPage(),
        RegisterPage.routeName: (context) => RegisterPage(),
        DetailScreen.routeName: (context) => DetailScreen(detailWebinar: ModalRoute.of(context)?.settings.arguments as Webinar),
        AllWebinar.routeName : (context) => AllWebinar(),
        FormPengajuan.routeName : (context) => FormPengajuan(),
      },
    );
  }
}

