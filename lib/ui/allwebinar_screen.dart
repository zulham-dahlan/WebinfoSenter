import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/common/text_theme.dart';
import 'package:webinfo_senter/data/firebase/firestore_service.dart';
import 'package:webinfo_senter/data/model/webinar.dart';
import 'package:webinfo_senter/widget/card_webinar_vertical.dart';

class AllWebinar extends StatefulWidget {
  static const routeName = '/all_webinar';

  const AllWebinar({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset('assets/back_icon.png'),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Semua Webinar',
                    style: myTextTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Kategori',
                style: myTextTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButton<String>(
                value: dropDownValue,
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: customRedColor,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue!;
                  });
                },
                items: <String>[
                  'Semua',
                  'Pengembangan Diri',
                  'Religi',
                  'Teknologi dan Informasi',
                  'Ekonomi'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              if (dropDownValue == 'Semua')
                Expanded(
                  child: FutureBuilder<List<Webinar>>(
                      future: FirestoreService.getDataWebinar(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasData) {
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
                          return Text('Check Your Internet Connection',
                              style: myTextTheme.bodyMedium!
                                  .copyWith(color: customRedDark));
                        }
                      }),
                )
              else
                Expanded(
                  child: FutureBuilder<List<Webinar>>(
                      future:
                          FirestoreService.getKategoriWebinar(dropDownValue),
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
                          return const Text('Something Wrong');
                        }
                      }),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
