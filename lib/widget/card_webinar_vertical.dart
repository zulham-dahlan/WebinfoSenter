import 'package:flutter/material.dart';
import 'package:webinfo_senter/data/webinar.dart';

class CardWebinarVertical extends StatelessWidget {
  final Webinar webinar ;

  const CardWebinarVertical({required this.webinar});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(webinar.urlPoster, fit: BoxFit.cover,scale: 0.5, width: 65, height: 85,)
          ),
          SizedBox(width: 10,),
          Column(
            children: [
              Text(
                webinar.judul,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                webinar.penyelenggara,
              ),
              Row(
                children: [
                  Icon(Icons.schedule),
                  Text(webinar.tglAcara),
                  Text(' - ${webinar.waktuAcara}'),
                ],
              )
            ],
          )

        ],
      )
    );
  }
}