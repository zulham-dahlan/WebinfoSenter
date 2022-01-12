import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webinfo_senter/data/firebase/auth_service.dart';
import 'package:webinfo_senter/data/model/akun.dart';
import 'package:webinfo_senter/data/model/webinar.dart';

class FirestoreService {
  static CollectionReference akunCollection =
      FirebaseFirestore.instance.collection('akun');
  static CollectionReference webinarCollection =
      FirebaseFirestore.instance.collection('webinar');

  static Future<void> addAkun(Akun akun, String documentId) async {
    await akunCollection.doc(documentId).set(akun.toJson());
  }

  static Future<Akun> readDataAkun() async {
    String documentId = await AuthServices.getId();
    DocumentSnapshot snapshot = await akunCollection.doc(documentId).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Akun.fromJson(data);
  }

  static Future<void> addWebinar(Webinar webinar) async{
    await webinarCollection.doc().set(webinar.toJson());
  }
  
  static Future<List<Webinar>> getDataWebinar() async {
    final List<Webinar> dataWebinar = [];
    await webinarCollection.get().then((snapshot) {
      for (var element in snapshot.docs) {
        dataWebinar.add(Webinar.fromJson(element.data() as Map<String,dynamic>));
      }
    });
    return dataWebinar;
  }

  static Future<List<Webinar>> getKategoriWebinar(String kategori) async {
    final List<Webinar> dataWebinar = [];
    await webinarCollection
        .where('kategori', isEqualTo: kategori)
        .get()
        .then((snapshot) {
      for (var element in snapshot.docs) {
        dataWebinar.add(Webinar.fromJson(element.data() as Map<String,dynamic>));
      }
    });
    return dataWebinar;
  }

  static Future<List<Webinar>> searchWebinar(String query) async {
    final List<Webinar> dataWebinar = [];
    await webinarCollection
        // .where('judul', isGreaterThanOrEqualTo: query)
        // .where('judul', isLessThan: query + 'z')
        .where('judul', isGreaterThanOrEqualTo: query).where('judul',isLessThanOrEqualTo:'$query\uf7ff')
        .get()
        .then((snapshot) {
      for (var element in snapshot.docs) {
        dataWebinar.add(Webinar.fromJson(element.data() as Map<String, dynamic>));
      }
    });
    return dataWebinar;
  }

  static Future<void> addBookmark(List<Webinar> listBookmark) async {
    String documentId = await AuthServices.getId();
    final List<Map<String,dynamic>> list = [];
    for(var element in listBookmark){
      list.add(element.toJson());
    }
    await akunCollection
        .doc(documentId)
        .update({'bookmark': FieldValue.arrayUnion(list)})
        .then((value) => print('Berhasil'))
        .catchError((error) => print('Gagal'));
  }

  static Future<void> deleteBookmark(int index) async {
    String documentId = await AuthServices.getId();
    await akunCollection.doc(documentId).collection('bookmark').doc().update({'$index' : FieldValue.delete()});
  }

  static Future<bool> checkConnection() async {
    try {
      final connect =
          await InternetAddress.lookup('google.com');
      if (connect.isNotEmpty && connect[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }
}
