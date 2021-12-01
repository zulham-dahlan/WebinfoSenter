import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';

class HomePage extends StatelessWidget {
  static const String homeTitle = 'Home';
  static const routeName = '/home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 60,
                        width: 60,
                        color: customRedLight,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome,',
                              style: styleMontserrat,
                            ),
                            Text(
                              'Zulham Dahlan',
                              style: styleRoboto,
                            )
                          ]),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: customRedLight,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Icon(Icons.notifications_none_outlined),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
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
                    return Card(
                      child: ListTile(
                        title: Text('Webinar $index'),
                        subtitle: Text('Deskripsi Webinar $index'),
                      ),
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
