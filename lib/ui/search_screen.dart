import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/common/text_theme.dart';
import 'package:webinfo_senter/data/firebase/firestore_service.dart';
import 'package:webinfo_senter/data/model/webinar.dart';
import 'package:webinfo_senter/widget/card_webinar_vertical.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search_screen';

  final String name;

  const SearchScreen({required this.name});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _controller;
  late String querySearch;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    querySearch = widget.name;
    _controller.text = querySearch;
  }

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
                  Flexible(
                    child: TextField(
                      controller: _controller,
                      onSubmitted: (String value) async {
                        setState(() {
                          querySearch = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Cari Webinar',
                        hintStyle: myTextTheme.bodyText1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Webinar terkait "$querySearch"',
                style: myTextTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                  child: FutureBuilder<List<Webinar>>(
                      future: FirestoreService.searchWebinar(querySearch),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final List<Webinar> allWebinar = snapshot.data!;
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: allWebinar.length,
                            itemBuilder: (BuildContext context, int index) {
                              Webinar webinar = allWebinar[index];
                              return Card(
                                child: CardWebinarVertical(webinar: webinar),
                              );
                            },
                          );
                        } else {
                          return Text('Something Wrong');
                        }
                      }),
                )
            ],
          ),
        ),
      ),
    );
  }
}
