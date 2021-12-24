import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/data/model/webinar.dart';
import 'package:webinfo_senter/provider/akun_provider.dart';
import 'package:webinfo_senter/widget/card_webinar_vertical.dart';

class WebinarkuPage extends StatefulWidget {
  static const String webinarkuTitle = 'Webinarku';
  static const routeName = '/webinarku_page';

  @override
  _WebinarkuPageState createState() => _WebinarkuPageState();
}

class _WebinarkuPageState extends State<WebinarkuPage> {

  @override
  Widget build(BuildContext context) {
    final bookmarkList =
        Provider.of<BookmarkProvider>(context, listen: false).bookmarkWebinar;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bookmark Webinar',
                style: styleRoboto,
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: bookmarkList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Webinar webinar = bookmarkList[index];
                      return Card(
                        child: CardWebinarVertical(webinar: webinar),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
