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
    await akunCollection.doc(documentId).set({
      'nama': akun.nama,
      'email': akun.email,
      'url_foto_profil': akun.urlFotoProfil,
      'bookmark': akun.bookmark,
      'publish': akun.publish
    });
  }

  static Future<Akun> readData() async {
    String documentId = await AuthServices.getId();
    DocumentSnapshot snapshot = await akunCollection.doc(documentId).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    Akun akun = Akun(
        nama: data['nama'],
        email: data['email'],
        urlFotoProfil: data['url_foto_profil'],
        bookmark: data['bookmark'],
        publish: data['publish']);
    return akun;
  }

  static Future<List<Webinar>> getDataWebinar() async {
    final List<Webinar> dataWebinar = [];
    await webinarCollection.get().then((snapshot) {
      snapshot.docs.forEach((element) {
        Map<String, dynamic> data = element.data() as Map<String, dynamic>;
        Webinar webinar = Webinar(
          judul: data['judul'],
          penyelenggara: data['penyelenggara'],
          deskripsi: data['deskripsi'],
          tglAcara: data['tgl_acara'],
          waktuAcara: data['waktu_acara'],
          lokasiAcara: data['lokasi_acara'],
          harga: data['harga'],
          linkPendaftaran: data['link_pendaftaran'],
          contactPerson: data['contact_person'],
          sosmed: data['sosmed'],
          benefit: data['benefit'],
          urlPoster: data['url_poster'],
          kategori: data['kategori'],
        );
        dataWebinar.add(webinar);
      });
    });
    return dataWebinar;
  }

  static Future<List<Webinar>> getKategoriWebinar(String kategori) async {
    final List<Webinar> dataWebinar = [];
    await webinarCollection
        .where('kategori', isEqualTo: kategori)
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((element) {
        Map<String, dynamic> data = element.data() as Map<String, dynamic>;
        Webinar webinar = Webinar(
          judul: data['judul'],
          penyelenggara: data['penyelenggara'],
          deskripsi: data['deskripsi'],
          tglAcara: data['tgl_acara'],
          waktuAcara: data['waktu_acara'],
          lokasiAcara: data['lokasi_acara'],
          harga: data['harga'],
          linkPendaftaran: data['link_pendaftaran'],
          contactPerson: data['contact_person'],
          sosmed: data['sosmed'],
          benefit: data['benefit'],
          urlPoster: data['url_poster'],
          kategori: data['kategori'],
        );
        dataWebinar.add(webinar);
      });
    });
    return dataWebinar;
  }

  static Future<List<Webinar>> searchWebinar(String query) async {
    final List<Webinar> dataWebinar = [];
    await webinarCollection
        .where('judul', isGreaterThanOrEqualTo: query)
        .where('judul', isLessThan: query + 'z')
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((element) {
        Map<String, dynamic> data = element.data() as Map<String, dynamic>;
        Webinar webinar = Webinar(
          judul: data['judul'],
          penyelenggara: data['penyelenggara'],
          deskripsi: data['deskripsi'],
          tglAcara: data['tgl_acara'],
          waktuAcara: data['waktu_acara'],
          lokasiAcara: data['lokasi_acara'],
          harga: data['harga'],
          linkPendaftaran: data['link_pendaftaran'],
          contactPerson: data['contact_person'],
          sosmed: data['sosmed'],
          benefit: data['benefit'],
          urlPoster: data['url_poster'],
          kategori: data['kategori'],
        );
        dataWebinar.add(webinar);
      });
    });
    return dataWebinar;
  }

  static Future<void> addBookmark(List<Webinar> listBookmark) async {
    String documentId = await AuthServices.getId();
    var listMapBookmark = await convertToMap(listBookmark);
    await akunCollection
        .doc(documentId)
        .update({'bookmark': FieldValue.arrayUnion(listMapBookmark)})
        .then((value) => print('Berhasil'))
        .catchError((error) => print('Gagal'));
  }

  // static Future<void> deleteBookmark(int index) async {
  //   String documentId = await AuthServices.getId();
  //   await akunCollection.doc(documentId).update()
  // }

  static Future<List<Webinar>> getBookmarkWebinar() async {
    Akun akun = await readData();
    var data = akun.bookmark as List<Map<String, dynamic>>;
    List<Webinar> listWebinar = [];
    if (data != null) {
      for (int x = 0; x < data.length; x++) {
        listWebinar.add(Webinar(
          judul: data[x]['judul'],
          penyelenggara: data[x]['penyelenggara'],
          deskripsi: data[x]['deskripsi'],
          tglAcara: data[x]['tgl_acara'],
          waktuAcara: data[x]['waktu_acara'],
          lokasiAcara: data[x]['lokasi_acara'],
          harga: data[x]['harga'],
          linkPendaftaran: data[x]['link_pendaftaran'],
          contactPerson: data[x]['contact_person'],
          sosmed: data[x]['sosmed'],
          benefit: data[x]['benefit'],
          urlPoster: data[x]['url_poster'],
          kategori: data[x][x],
        ));
      }
    }
    return listWebinar;
  }

  static Future<List<Map<String, dynamic>>> convertToMap(
      List<Webinar> listWebinar) async {
    List<Map<String, dynamic>> listMap = [];
    for (int x = 0; x < listWebinar.length; x++) {
      listMap.add({
        'judul': listWebinar[x].judul,
        'penyelenggara': listWebinar[x].penyelenggara,
        'deskripsi': listWebinar[x].deskripsi,
        'tgl_acara': listWebinar[x].tglAcara,
        'waktu_acara': listWebinar[x].waktuAcara,
        'lokasi_acara': listWebinar[x].lokasiAcara,
        'harga': listWebinar[x].harga,
        'link_pendaftaran': listWebinar[x].linkPendaftaran,
        'contact_person': listWebinar[x].contactPerson,
        'sosmed': listWebinar[x].sosmed,
        'benefit': listWebinar[x].benefit,
        'url_poster': listWebinar[x].urlPoster,
        'kategori': listWebinar[x].kategori,
      });
    }
    return listMap;
  }
}
