import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webinfo_senter/common/text_theme.dart';
import 'package:webinfo_senter/helper/result_state.dart';
import 'package:webinfo_senter/provider/bookmark_provider.dart';
import 'package:webinfo_senter/widget/card_webinar_vertical.dart';

class WebinarkuPage extends StatelessWidget {
  static const String webinarkuTitle = 'Webinarku';
  static const routeName = '/webinarku_page';

  const WebinarkuPage({Key? key}) : super(key: key);
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
              Text(
                'Bookmark Webinar',
                style: myTextTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Consumer<BookmarkProvider>(
                builder: (context, snapshot, child) {
                  if (snapshot.state == ResultState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.state == ResultState.hasData) {
                    var listBookmark = snapshot.bookmark;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: listBookmark.length,
                        itemBuilder: (context, index) {
                          return CardWebinarVertical(
                              webinar: listBookmark[index]);
                        },
                      ),
                    );
                  } else if (snapshot.state == ResultState.noData ||
                      snapshot.bookmark.isEmpty) {
                    return Center(child: Text(snapshot.message));
                  } else if (snapshot.state == ResultState.error) {
                    return Center(child: Text(snapshot.message));
                  } else {
                    return const Center(child: Text(''));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
