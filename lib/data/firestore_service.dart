
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webinfo_senter/data/akun.dart';

class FirestoreService{
  static CollectionReference akunCollection = FirebaseFirestore.instance.collection('akun');

  static Future<void> addAkun(Akun akun) async{
    await akunCollection.add({
      'nama' : akun.nama,
      'email' : akun.email,
      'url_foto_profil' : akun.urlFotoProfil,
      'bookmark' : akun.bookmark,
      'publish' : akun.publish
    });
  }
}