import 'package:flutter/material.dart';
import 'package:webinfo_senter/data/firebase/firestore_service.dart';
import 'package:webinfo_senter/data/model/webinar.dart';
import 'package:webinfo_senter/helper/result_state.dart';

class BookmarkProvider extends ChangeNotifier {
  List<Webinar> _bookmark = [];
  IconData _icon = Icons.bookmark_border;
  late ResultState _state;
  late ResultState _bookmarkState;
  String _message = '';

  List<Webinar> get bookmark => _bookmark;
  IconData get icon => _icon;
  ResultState get state => _state;
  ResultState get bookmarkState => _bookmarkState;
  String get message => _message;

  BookmarkProvider() {
    _fetchDataBookmark();
  }

  Future<void> addBookmark(Webinar webinar) async {
    _bookmark.add(webinar);
    _icon = Icons.bookmarks;
    await FirestoreService.updateBookmark(bookmark);
    notifyListeners();   
  }

  Future<void> deleteBookmark(Webinar webinar) async{
    _bookmark.remove(webinar);
    _icon = Icons.bookmark_border;
    await FirestoreService.deleteBookmark(webinar);
    notifyListeners();   
  }

  Future<void> getBookmarkByJudul(String judul) async {
    try {
      final result = bookmark;
      bool isFound = false;
      for (var e in result) {
        if (e.judul == judul) {
          isFound = true;
        }
      }
      if (isFound) {
        _bookmarkState = ResultState.hasData;
        _icon = Icons.bookmarks;
        notifyListeners();
      } else {
        _bookmarkState = ResultState.noData;
        _icon = Icons.bookmark_border;
        notifyListeners();   
      }
    } catch (e) {
      _bookmarkState = ResultState.error;
      
    }
    
  }

  Future<void> _fetchDataBookmark() async {
    _state = ResultState.loading;
    notifyListeners();
    final getConnection = await FirestoreService.checkConnection();
    try {
      if (getConnection) {
        final result = await FirestoreService.readDataAkun();
        if (result.bookmark.isNotEmpty) {
          _bookmark = result.bookmark;
          _state = ResultState.hasData;
          notifyListeners();
        } else {
          _state = ResultState.noData;
          _message = "Belum ada bookmark";
          _bookmark.clear();
          notifyListeners();
        }
      } else {
        _state = ResultState.error;
        notifyListeners();
        _message = 'Check Your Internet Connection';
      }
    } catch (e) {
      _state = ResultState.error;
      _message = "Error : $e";
      notifyListeners();
    }
  }
}
