import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/data/model/webinar.dart';
import 'package:webinfo_senter/widget/card_webinar_vertical.dart';

class AllWebinar extends StatefulWidget {
  static const routeName = '/all_webinar';

  @override
  _AllWebinarState createState() => _AllWebinarState();
}

class _AllWebinarState extends State<AllWebinar> {
  String dropDownValue = 'Semua';
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
              Row(
                children: [
                  IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Image.asset('assets/back_icon.png'),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Semua Webinar',
                    style: styleRobotoTitle,
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Kategori',
                style: styleRoboto,
              ),
              DropdownButton<String>(
                value: dropDownValue,
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: customRedColor,
                ),
                onChanged: (String? newValue){
                  setState((){
                    dropDownValue = newValue!;
                  });
                },
                items: <String>['Semua','Pengembangan Diri', 'Religi', 'Teknologi'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(value: value, child: Text(value),);
                }).toList(),
              ),
               SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: listWebinar.length,
                  itemBuilder: (BuildContext context, int index) {
                    Webinar webinar = listWebinar[index];
                    return Card(
                      child: CardWebinarVertical(webinar: webinar),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
