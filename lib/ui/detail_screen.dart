import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/data/webinar.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = '/detail_screen';

  final Webinar detailWebinar;

  DetailScreen({required this.detailWebinar});

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
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset(
                      webinar.urlPoster,
                      height: 380,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(webinar.judul),
                        Text('Oleh : ${webinar.penyelenggara}')
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: customRedColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.bookmark_border)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: customRedColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Icon(Icons.calendar_today, color: Colors.white,),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text('${webinar.tglAcara} - ${webinar.waktuAcara}'),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: customRedColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text('Rp', style: TextStyle(color: Colors.white),),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(webinar.harga),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: customRedColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Icon(Icons.place_outlined, color: Colors.white),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(webinar.lokasiAcara),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('Deskripsi'),
                Text(webinar.deskripsi),
                SizedBox(
                  height: 10.0,
                ),
                Text('Benefit'),
                Text(webinar.benefit),
                SizedBox(
                  height: 10.0,
                ),
                Text('Contact Person'),
                Row(
                  children: [
                    Icon(Icons.chat_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text(webinar.contactPerson),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.language_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text(webinar.sosmed),
                  ],
                ),
                 SizedBox(
                  height: 10.0,
                ),
                Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: customRedColor,
                    ),
                    onPressed: () {},
                    child: Text('Buka Link Pendaftaran',style: TextStyle(color: Colors.white),),
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
