import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webinfo_senter/data/firebase/firestore_service.dart';
import 'package:webinfo_senter/data/model/webinar.dart';

enum ResultState {Loading, NoData, HasData, Error}

class BookmarkProvider extends ChangeNotifier{

  BookmarkProvider(){
    _fetchDataBookmark();
  }

  List<Webinar> _bookmarkWebinar = [];
  IconData _icon = Icons.bookmark_border;
  late ResultState _state ;
  late ResultState _bookmarkState ;
  
  List<Webinar> get bookmarkWebinar => _bookmarkWebinar;
  IconData get icon => _icon ;
  ResultState get state => _state ;
  ResultState get bookmarkState => _bookmarkState ;

  void addBookmark(Webinar webinar){
    _bookmarkWebinar.add(webinar);
    _icon = Icons.bookmarks ;
    // getBookmarkByJudul(webinar.judul);
    FirestoreService.addBookmark(bookmarkWebinar);
    notifyListeners();
  }

  void deleteBookmark(Webinar webinar){
    _bookmarkWebinar.remove(webinar);
    _icon = Icons.bookmark_border ;
    notifyListeners();
    //  getBookmarkByJudul(webinar.judul);
  }

  void getBookmarkByJudul(String judul) async {
    try{
      final result = bookmarkWebinar;
      bool isFound = false ;
      for(var e in result){
        if(e.judul == judul){
          isFound = true ;
        }
      }
      if(isFound){
        _bookmarkState = ResultState.HasData;
        _icon = Icons.bookmarks ;
        notifyListeners();
      }else{
        _bookmarkState = ResultState.NoData;
        _icon = Icons.bookmark_border ;
        notifyListeners();
      }
    }catch(e){ 
      _bookmarkState = ResultState.Error;
      notifyListeners();
    }
  }

  void _fetchDataBookmark() async {
    _state = ResultState.Loading;
    try{
      final result = await FirestoreService.getBookmarkWebinar();
      if(result.isNotEmpty){
        _bookmarkWebinar = result ;
        _state = ResultState.HasData;
        notifyListeners();
      }else{
        _bookmarkWebinar.clear();
        _state = ResultState.NoData;
        notifyListeners();
      }
    }catch(e){
      _state = ResultState.Error;
      notifyListeners();
    }
  }

}