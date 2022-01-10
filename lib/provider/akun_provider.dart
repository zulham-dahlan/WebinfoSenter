import 'package:flutter/material.dart';
import 'package:webinfo_senter/data/firebase/firestore_service.dart';
import 'package:webinfo_senter/data/model/akun.dart';
import 'package:webinfo_senter/helper/result_state.dart';


class AkunProvider extends ChangeNotifier{

  AkunProvider(){
    fetchDataAkun();
  }

  late Akun _userAkun ;
  late ResultState _state ;
  String _message = '';

  Akun get userAkun => _userAkun;
  ResultState get state => _state ;
  String get message => _message ;

  Future<void> fetchDataAkun() async {
    _state = ResultState.loading;
    notifyListeners();
    try{
      final getConnection =  await FirestoreService.checkConnection();
      if(getConnection){
        final Akun? snapshot = await FirestoreService.readDataAkun();
        if(snapshot != null){
          _userAkun = snapshot; 
          _state = ResultState.hasData;
          notifyListeners();
        }else{
          _state = ResultState.noData;
          notifyListeners();
          _message = 'Data not found';
        }
      }else{
        _state = ResultState.error;
        notifyListeners();
        _message = 'Check Your Internet Connection';
      }
    }catch (e){
      _state = ResultState.error;
       notifyListeners();
       _message = 'Error : $e';
    } 
  }
  



  // List<Webinar> _bookmarkWebinar = [];
  // IconData _icon = Icons.bookmark_border;
  // late ResultState _state ;
  // late ResultState _bookmarkState ;
  
  // List<Webinar> get bookmarkWebinar => _bookmarkWebinar;
  // IconData get icon => _icon ;
  // ResultState get state => _state ;
  // ResultState get bookmarkState => _bookmarkState ;

  // void addBookmark(Webinar webinar){
  //   _bookmarkWebinar.add(webinar);
  //   _icon = Icons.bookmarks ;
  //   // getBookmarkByJudul(webinar.judul);
  //   FirestoreService.addBookmark(bookmarkWebinar);
  //   notifyListeners();
  // }

  // void deleteBookmark(Webinar webinar){
  //   int? position ;
  //   final result = bookmarkWebinar;
  //   for(int x = 0 ; x < result.length ; x++){
  //     if(result[x].judul == webinar.judul){
  //       position = x ;
  //     }
  //   }
  //   _bookmarkWebinar.remove(webinar);
  //   _icon = Icons.bookmark_border ;
  //   FirestoreService.deleteBookmark(position!);
  //   notifyListeners();
  //   //  getBookmarkByJudul(webinar.judul);
  // }

  // void getBookmarkByJudul(String judul) async {
  //   try{
  //     final result = bookmarkWebinar;
  //     bool isFound = false ;
  //     for(var e in result){
  //       if(e.judul == judul){
  //         isFound = true ;
  //       }
  //     }
  //     if(isFound){
  //       _bookmarkState = ResultState.HasData;
  //       _icon = Icons.bookmarks ;
  //       notifyListeners();
  //     }else{
  //       _bookmarkState = ResultState.NoData;
  //       _icon = Icons.bookmark_border ;
  //       notifyListeners();
  //     }
  //   }catch(e){ 
  //     _bookmarkState = ResultState.Error;
  //     notifyListeners();
  //   }
  // }

  // void _fetchDataBookmark() async {
  //   _state = ResultState.Loading;
  //   try{
  //     final result = await FirestoreService.getBookmarkWebinar();
  //     if(result.isNotEmpty){
  //       _bookmarkWebinar = result ;
  //       _state = ResultState.HasData;
  //       notifyListeners();
  //     }else{
  //       _bookmarkWebinar.clear();
  //       _state = ResultState.NoData;
  //       notifyListeners();
  //     }
  //   }catch(e){
  //     _state = ResultState.Error;
  //     notifyListeners();
  //   }
  // }

}