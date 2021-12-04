import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';

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
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Ink(
                    decoration: const ShapeDecoration(shape: CircleBorder(), color: Colors.pinkAccent,),
                    child: IconButton(onPressed: (){
                      Navigator.pop(context);
                    },alignment: Alignment.center, icon: Icon(Icons.arrow_back_ios),color: Colors.white,)
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
                style: styleRoboto,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
