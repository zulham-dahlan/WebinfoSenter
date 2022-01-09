import 'package:webinfo_senter/data/model/webinar.dart';

class Akun{
  String nama ;
  String email ;
  String? urlFotoProfil ;
  List<Webinar>? bookmark ;
  List<Webinar>? publish ;

  Akun({
    required this.nama,
    required this.email,
    required this.urlFotoProfil,
    required this.bookmark,
    required this.publish,
  });

  
}