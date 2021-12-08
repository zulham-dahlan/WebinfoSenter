import 'package:flutter/material.dart';
import 'package:webinfo_senter/data/webinar.dart';
import 'package:webinfo_senter/ui/detail_screen.dart';

class CardWebinarVertical extends StatelessWidget {
  final Webinar webinar;

  const CardWebinarVertical({required this.webinar});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailScreen.routeName, arguments: webinar);
      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(
                  webinar.urlPoster,
                  fit: BoxFit.cover,
                  width: 65,
                  height: 85,
                )),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  webinar.judul,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  webinar.penyelenggara,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 12,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('${webinar.tglAcara} - ${webinar.waktuAcara}'),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
