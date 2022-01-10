import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/data/firebase/auth_service.dart';
import 'package:webinfo_senter/data/model/webinar.dart';
import 'package:webinfo_senter/helper/result_state.dart';
import 'package:webinfo_senter/provider/akun_provider.dart';
import 'package:webinfo_senter/provider/bookmark_provider.dart';

class BookmarkButton extends StatelessWidget {
  BookmarkButton({required this.webinar});

  final Webinar webinar;
  
  @override
  Widget build(BuildContext context) {
    return Consumer<BookmarkProvider>(
      builder: (context, data, widget) {
        data.getBookmarkByJudul(webinar.judul);
        return Container(
          width: 50,
          height: 35,
          decoration: BoxDecoration(
            border: Border.all(
              color: customRedColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(2),
          ),
          child:
              IconButton(onPressed: () {
                if(data.bookmarkState == ResultState.noData){
                  data.addBookmark(webinar);
                  AuthServices.showSnackbar('Tersimpan', context);
                }else{
                  data.deleteBookmark(webinar);
                  AuthServices.showSnackbar('Terhapus', context);
                }
              }, icon: Icon(data.icon,color: customRedColor,)),
        );
      },
    );
  }
}
