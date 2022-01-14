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

  Future<void> updateProfile(String nama, String profil) async{
    _userAkun.nama = nama ;
    _userAkun.urlFotoProfil = profil ;
    notifyListeners();
  } 

}