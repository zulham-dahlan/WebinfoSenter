import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/common/text_theme.dart';
import 'package:webinfo_senter/data/firebase/firestore_service.dart';
import 'package:webinfo_senter/data/model/webinar.dart';
import 'package:webinfo_senter/helper/result_state.dart';
import 'package:webinfo_senter/provider/akun_provider.dart';
import 'package:webinfo_senter/ui/allwebinar_screen.dart';
import 'package:webinfo_senter/ui/search_screen.dart';
import 'package:webinfo_senter/widget/app_header.dart';
import 'package:webinfo_senter/widget/card_webinar_vertical.dart';

class HomePage extends StatefulWidget {
  static const String homeTitle = 'Home';
  static const routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<AkunProvider>(
                builder: (context, snapshot, child) {
                  if (snapshot.state == ResultState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.state == ResultState.hasData) {
                    return AppHeader(snapshot.userAkun);
                  } else {
                    return Text(snapshot.message);
                  }
                },
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: queryController,
                onSubmitted: (String value) {
                  Navigator.pushNamed(context, SearchScreen.routeName,
                      arguments: value);
                  queryController.text = '';
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Cari Webinar',
                  hintStyle: myTextTheme.bodyText1,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Webinar Terbaru',
                style: myTextTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: FutureBuilder<List<Webinar>>(
                    future: FirestoreService.getDataWebinar(),
                    builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return const Center(child: CircularProgressIndicator(),);
                      }else if (snapshot.hasData) {
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
                      } else {
                        return const Text('Check Your Internet Connection');
                      }
                    }),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
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
                      style:
                          myTextTheme.button!.copyWith(color: customRedColor),
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

  @override
  void dispose() {
    // TODO: implement dispose
    queryController.dispose();
    super.dispose();
  }
}
