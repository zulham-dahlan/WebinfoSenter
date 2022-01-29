import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/text_theme.dart';
import 'package:webinfo_senter/data/model/webinar.dart';
import 'package:webinfo_senter/ui/detail_screen.dart';

class CardWebinarVertical extends StatelessWidget {
  final Webinar webinar;

  const CardWebinarVertical({Key? key, required this.webinar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailScreen.routeName,
            arguments: webinar);
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.network(
                  webinar.urlPoster,
                  fit: BoxFit.fitWidth,
                  width: 65,
                  height: 85,
                )),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    webinar.judul,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: myTextTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    webinar.penyelenggara,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: myTextTheme.caption,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 12,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        webinar.tglAcara,
                        style: myTextTheme.caption,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                        size: 12,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        webinar.waktuAcara,
                        style: myTextTheme.caption,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
