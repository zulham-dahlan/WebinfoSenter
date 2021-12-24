
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:webinfo_senter/data/firebase/auth_service.dart';
import 'package:webinfo_senter/data/model/akun.dart';

class FirestoreService{
  static CollectionReference akunCollection = FirebaseFirestore.instance.collection('akun');

  static Future<void> addAkun(Akun akun, String documentId) async{
    await akunCollection.doc(documentId).set({
      'nama' : akun.nama,
      'email' : akun.email,
      'url_foto_profil' : akun.urlFotoProfil,
      'bookmark' : akun.bookmark,
      'publish' : akun.publish,
      'url' : akun.url,
    });
  }

  static Future<Akun> readData() async{
    String documentId = await AuthServices.getId();
    DocumentSnapshot snapshot = await akunCollection.doc(documentId).get();
    Map<String,dynamic> data = snapshot.data() as Map<String, dynamic>;
    Akun akun = Akun(nama: data['nama'], email: data['email'], urlFotoProfil: data['url_foto_profil'], bookmark: data['bookmark'], publish: data['publish'],url: data['url']);
    return akun ;
  }

}