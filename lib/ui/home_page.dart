import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/data/webinar.dart';
import 'package:webinfo_senter/ui/search_screen.dart';
import 'package:webinfo_senter/widget/app_header.dart';
import 'package:webinfo_senter/widget/card_webinar_vertical.dart';

class HomePage extends StatelessWidget {
  static const String homeTitle = 'Home';
  static const routeName = '/home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(),
              SizedBox(
                height: 30,
              ),
              TextField(
                onSubmitted: (String value) {
                  Navigator.pushNamed(context, SearchScreen.routeName,arguments: value);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Cari Webinar',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Webinar Terbaru',
                style: styleRoboto,
              ),
               SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    Webinar webinar = listWebinar[index];
                    return Card(
                      child: CardWebinarVertical(webinar: webinar),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:10),
                alignment: Alignment.center,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: customRedColor),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Lihat Semua Webinar',
                      style: TextStyle(
                        color: customRedColor,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
