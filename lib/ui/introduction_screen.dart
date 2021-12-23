import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/data/firebase/auth_service.dart';
import 'package:webinfo_senter/data/model/intro.dart';

class IntroductionScreen extends StatefulWidget {
  static const routeName = '/introduction_screen';

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final List<Intro> introductionList = [
    Intro(
        image: 'assets/girls-gathering.png',
        title: 'Webinar dari rumah\nbersama teman dan keluarga',
        description: 'Ikut webinar semakin mudah dengan Webinfo Senter'),
    Intro(
        image: 'assets/man-working-from-home.png',
        title: 'Tentukan jadwal luang\nyang sesuai kegiatan kamu',
        description:
            'Makin produktif dengan waktu fleksibel\ndi rumah dengan Webinfo Senter'),
    Intro(
        image: 'assets/guy-on-bike.png',
        title: 'Yuk gabung sekarang!',
        description: "Let's Goo"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Swiper.children(
        index: 0,
        autoplay: false,
        loop: false,
        pagination: SwiperPagination(
          margin: EdgeInsets.only(bottom: 20.0),
          builder: DotSwiperPaginationBuilder(
            color: customRedLight,
            activeColor: customRedColor,
            size: 10.0,
            activeSize: 10.0,
          ),
        ),
        // control: SwiperControl(),
        children: _buildPage(context),
      ),
    );
  }

  List<Widget> _buildPage(BuildContext context) {
    List<Widget> widgets = [];
    Size size = MediaQuery.of(context).size;
    for (int i = 0; i < introductionList.length; i++) {
      Intro intro = introductionList[i];
      widgets.add(
        Container(
          padding: EdgeInsets.only(top: size.height / 6),
          child: Column(
            children: <Widget>[
              Image.asset(
                intro.image,
                height: size.height / 3.5,
              ),
              SizedBox(
                height: size.height / 12.0,
              ),
              Center(
                child: Text(
                  intro.title,
                  style: styleRoboto,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: size.height / 20.0,
              ),
              if (i == introductionList.length - 1)
                ElevatedButton(
                  onPressed: () {
                    AuthServices.toLoginorHome(context);
                  },
                  child: Text(intro.description),
                  style: ElevatedButton.styleFrom(
                    primary: customRedColor,
                  )
                )
              else
                Container(
                  child: Text(
                    intro.description,
                    style: styleMontserrat,
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      );
    }
    return widgets;
  }
}
