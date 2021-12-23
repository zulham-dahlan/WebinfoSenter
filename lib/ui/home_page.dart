import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/data/firebase/auth_service.dart';
import 'package:webinfo_senter/data/firebase/firestore_service.dart';
import 'package:webinfo_senter/data/model/akun.dart';
import 'package:webinfo_senter/data/model/webinar.dart';
import 'package:webinfo_senter/ui/allwebinar_screen.dart';
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
              FutureBuilder<Akun>(
                  future: FirestoreService.readData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return AppHeader(snapshot.data!);
                    }
                    return Text('Something Wrong');
                  }),
              SizedBox(
                height: 30,
              ),
              TextField(
                onSubmitted: (String value) {
                  Navigator.pushNamed(context, SearchScreen.routeName,
                      arguments: value);
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
                child: FutureBuilder<List<Webinar>>(
                  future: FirestoreService.getDataWebinar(),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      final List<Webinar> allWebinar = snapshot.data!;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          Webinar webinar = allWebinar[index];
                          return Card(
                            child: CardWebinarVertical(webinar: webinar),
                          );
                        },
                      );
                    }else{
                      return Text('Something Wrong');
                    }
                  }
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: customRedColor),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AllWebinar.routeName);
                    },
                    child: Text(
                      'Lihat Semua Webinar',
                      style: TextStyle(
                        color: customRedColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
