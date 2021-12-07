import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';

class WebinarkuPage extends StatelessWidget {
  static const String webinarkuTitle = 'Webinarku';
  static const routeName = '/webinarku_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Webinarku',
                style: styleRoboto,
              ),
              SizedBox(
                height: 20,
              ),
              Text('On Going'),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context,int index){
                    return Card(child: Center(child: Text('Webinar $index')));
                  }
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Finish'),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context,int index){
                    return Card(child: Center(child: Text('Webinar $index')));
                  }
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Your Publish'),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context,int index){
                    return Card(child: Center(child: Text('Webinar $index')));
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
