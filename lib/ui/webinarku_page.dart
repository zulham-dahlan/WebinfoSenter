import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/data/model/webinar.dart';
import 'package:webinfo_senter/provider/akun_provider.dart';
import 'package:webinfo_senter/ui/pengajuan_screen.dart';
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
                style: styleRobotoTitle,
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

      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(kToolbarHeight),
      //   child: Container(
      //     child: SafeArea(
      //       child: Column(
      //         children: [],
      //       ),
      // child: TabBar(
      //   labelColor: Colors.black,
      //   indicatorColor: customRedColor,
      //   controller: _tabController,
      //   tabs: [
      //     Tab(
      //       text: 'Your Bookmark',
      //     ),
      //     Tab(
      //       text: 'Your Publish',
      //     ),
      //   ],
      // ),
      //     ),
      //   ),
      // ),
      // body: TabBarView(
      //   controller: _tabController,
      //   children: <Widget>[
      //     Container(
      //       padding: EdgeInsets.all(20.0),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text('On Going'),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Expanded(
      //             child: ListView.builder(
      //                 shrinkWrap: true,
      //                 scrollDirection: Axis.horizontal,
      //                 itemCount: listWebinar.length,
      //                 itemBuilder: (BuildContext context, int index) {
      //                   Webinar webinar = listWebinar[index];
      //                   return Card(
      //                     child: Container(
      //                       padding: EdgeInsets.all(5),
      //                       child: Image.asset(webinar.urlPoster,
      //                           height: 150, fit: BoxFit.cover),
      //                     ),
      //                   );
      //                 }),
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           Text('Finish'),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Expanded(
      //             child: ListView.builder(
      //                 shrinkWrap: true,
      //                 scrollDirection: Axis.horizontal,
      //                 itemCount: listWebinar.length,
      //                 itemBuilder: (BuildContext context, int index) {
      //                   Webinar webinar = listWebinar[index];
      //                   return Card(
      //                     child: Container(
      //                       padding: EdgeInsets.all(5),
      //                       child: Image.asset(webinar.urlPoster,
      //                           height: 150, fit: BoxFit.cover),
      //                     ),
      //                   );
      //                 }),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Container(
      //       padding: EdgeInsets.only(
      //           top: 10.0, left: 20.0, right: 20.0, bottom: 20.0),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Container(
      //             margin: EdgeInsets.only(bottom: 10),
      //             child: SizedBox(
      //               width: double.infinity,
      //               child: TextButton(
      //                 style: TextButton.styleFrom(
      //                   backgroundColor: customRedColor,
      //                 ),
      //                 onPressed: () {
      //                   Navigator.pushNamed(context, FormPengajuan.routeName);
      //                 },
      //                 child: Text(
      //                   'Ajukan Webinar',
      //                   style: TextStyle(color: Colors.white),
      //                 ),
      //               ),
      //             )
      //           ),
      //           Expanded(
      //             child: ListView.builder(
      //                 shrinkWrap: true,
      //                 itemCount: listWebinar.length,
      //                 itemBuilder: (BuildContext context, int index) {
      //                   Webinar webinar = listWebinar[index];
      //                   return Card(
      //                     child: CardWebinarVertical(webinar: webinar),
      //                   );
      //                 }),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
