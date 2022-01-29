import 'package:webinfo_senter/data/model/webinar.dart';

class Akun{
  String nama ;
  String email ;
  String urlFotoProfil ;
  List<Webinar> bookmark ;
  List<Webinar> publish ;

  Akun({
    required this.nama,
    required this.email,
    required this.urlFotoProfil,
    required this.bookmark,
    required this.publish,
  });

  factory Akun.fromJson(Map<String, dynamic> json) => Akun(
    nama: json['nama'],
    email: json['email'],
    urlFotoProfil: json['url_foto_profil'],
    bookmark: List<Webinar>.from(json['bookmark'].map((x) => Webinar.fromJson(x))),
    publish: List<Webinar>.from(json['publish'].map((x) => Webinar.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'nama' : nama,
    'email' : email,
    'url_foto_profil' : urlFotoProfil,
    'bookmark' : List<Webinar>.from(bookmark.map((e) => e.toJson())),
    'publish' : List<Webinar>.from(publish.map((e) => e.toJson())),
  };

  
}