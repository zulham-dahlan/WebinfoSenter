
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webinfo_senter/data/firebase/auth_service.dart';
import 'package:webinfo_senter/data/model/akun.dart';
import 'package:webinfo_senter/data/model/webinar.dart';

class FirestoreService{
  static CollectionReference akunCollection = FirebaseFirestore.instance.collection('akun');
  static CollectionReference webinarCollection = FirebaseFirestore.instance.collection('webinar');

  static Future<void> addAkun(Akun akun, String documentId) async{
    await akunCollection.doc(documentId).set({
      'nama' : akun.nama,
      'email' : akun.email,
      'url_foto_profil' : akun.urlFotoProfil,
      'bookmark' : akun.bookmark,
      'publish' : akun.publish
    });
  }

  static Future<Akun> readData() async{
    String documentId = await AuthServices.getId();
    DocumentSnapshot snapshot = await akunCollection.doc(documentId).get();
    Map<String,dynamic> data = snapshot.data() as Map<String, dynamic>;
    Akun akun = Akun(nama: data['nama'], email: data['email'], urlFotoProfil: data['url_foto_profil'], bookmark: data['bookmark'], publish: data['publish']);
    return akun ;
  }

  static Future<List<Webinar>> getDataWebinar() async {
    final List<Webinar> dataWebinar = [];
    await webinarCollection.get().then((snapshot){
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
    await webinarCollection.where('kategori', isEqualTo: kategori).get().then((snapshot){
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


}