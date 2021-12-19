
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webinfo_senter/data/model/akun.dart';

class FirestoreService{
  static CollectionReference akunCollection = FirebaseFirestore.instance.collection('akun');

  static Future<void> addAkun(Akun akun, String documentId) async{
    await akunCollection.doc(documentId).set({
      'nama' : akun.nama,
      'email' : akun.email,
      'url_foto_profil' : akun.urlFotoProfil,
      'bookmark' : akun.bookmark,
      'publish' : akun.publish
    });
  }
}