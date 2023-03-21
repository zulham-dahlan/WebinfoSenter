import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/common/text_theme.dart';
import 'package:webinfo_senter/data/model/webinar.dart';
import 'package:webinfo_senter/widget/bookmark_button.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = '/detail_screen';

  final Webinar detailWebinar;

  // ignore: use_key_in_widget_constructors
  const DetailScreen({required this.detailWebinar});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Webinar webinar;

  @override
  void initState() {
    super.initState();
    webinar = widget.detailWebinar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(
                      webinar.urlPoster,
                      height: 380,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            webinar.judul,
                            maxLines: 2,
                            style: myTextTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text('Oleh : ${webinar.penyelenggara}',
                              style: myTextTheme.bodyLarge)
                        ],
                      ),
                    ),
                    BookmarkButton(webinar: webinar),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: customRedDark,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Harga',
                              style: myTextTheme.bodySmall!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              webinar.harga,
                              style: myTextTheme.bodyLarge!.copyWith(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: customRedDark,
                        ),
                        child: Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Lokasi',
                                style: myTextTheme.bodySmall!
                                    .copyWith(color: Colors.white),
                              ),
                              Text(
                                webinar.lokasiAcara,
                                style: myTextTheme.bodyLarge!
                                    .copyWith(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: customRedDark,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Tanggal & Waktu Acara',
                            style: myTextTheme.bodySmall!
                                .copyWith(color: Colors.white)),
                        Text('${webinar.tglAcara} - ${webinar.waktuAcara}',
                            style: myTextTheme.bodyLarge!
                                .copyWith(color: Colors.white))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text('Deskripsi',
                    style: myTextTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 5.0,
                ),
                Text(webinar.deskripsi, style: myTextTheme.bodyMedium),
                const SizedBox(
                  height: 10.0,
                ),
                Text('Benefit',
                    style: myTextTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 5.0,
                ),
                Text(webinar.benefit, style: myTextTheme.bodyMedium),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Contact Person',
                  style: myTextTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    const Icon(Icons.chat_outlined),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(webinar.contactPerson, style: myTextTheme.bodyMedium),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.language_outlined),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(webinar.sosmed, style: myTextTheme.bodyMedium),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: customRedColor,
                      ),
                      onPressed: () async {
                        String url = 'https://' + webinar.linkPendaftaran;

                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          // ignore: avoid_print
                          print('URL Tidak bisa dibuka');
                        }
                      },
                      child: const Text(
                        'Buka Link Pendaftaran',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
