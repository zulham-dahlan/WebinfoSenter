import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/common/text_theme.dart';
import 'package:webinfo_senter/data/firebase/auth_service.dart';
import 'package:webinfo_senter/data/firebase/firestore_service.dart';
import 'package:webinfo_senter/data/firebase/storage_service.dart';
import 'package:webinfo_senter/data/model/webinar.dart';

class FormPengajuan extends StatefulWidget {
  static const routeName = '/form_pengajuan';

  const FormPengajuan({Key? key}) : super(key: key);

  @override
  _FormPengajuanState createState() => _FormPengajuanState();
}

class _FormPengajuanState extends State<FormPengajuan> {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _penyelenggaraController =
      TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _tglAcaraController = TextEditingController();
  final TextEditingController _waktuAcaraController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _lokasiAcaraController = TextEditingController();
  final TextEditingController _linkPendaftaranController =
      TextEditingController();
  final TextEditingController _contactPersonController =
      TextEditingController();
  final TextEditingController _sosmedController = TextEditingController();
  final TextEditingController _benefitController = TextEditingController();
  String dropDownValue = 'Pengembangan Diri';
  late String urlPoster;
  String namePoster = '';
  late File image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Ajukan Webinar',
                    style: myTextTheme.titleLarge,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Judul Acara',
                  style: myTextTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: _judulController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Badan / Lembaga Penyelenggara',
                  style: myTextTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: _penyelenggaraController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Deskripsi',
                  style: myTextTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: _deskripsiController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Tanggal & Waktu Acara',
                  style: myTextTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 170,
                      child: TextFormField(
                        controller: _tglAcaraController,
                        decoration: const InputDecoration(
                          hintText: '01 Januari 2021',
                          border: OutlineInputBorder(),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: TextFormField(
                        controller: _waktuAcaraController,
                        decoration: const InputDecoration(
                          hintText: '08:00',
                          border: OutlineInputBorder(),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Lokasi Acara',
                  style: myTextTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: _lokasiAcaraController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Harga Pendaftaran',
                  style: myTextTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: _hargaController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Free / Rp. -'),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Link Pendaftaran',
                  style: myTextTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: _linkPendaftaranController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Contact Person',
                  style: myTextTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: _contactPersonController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'ex. 085821212100'),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Situs / Media Sosial',
                  style: myTextTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: _sosmedController,
                  decoration: const InputDecoration(
                    hintText: 'ex. @webinfosenter / www.webinfo.com',
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Benefit Acara',
                  style: myTextTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: _benefitController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Text(
                      'Kategori : ',
                      style: myTextTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    DropdownButton<String>(
                      value: dropDownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      underline: Container(
                        height: 2,
                        color: customRedColor,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownValue = newValue!;
                        });
                      },
                      items: <String>[
                        'Pengembangan Diri',
                        'Religi',
                        'Teknologi dan Informasi',
                        'Ekonomi'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value, style: myTextTheme.bodyLarge),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () async {
                      await ImagePicker()
                          .pickImage(
                              source: ImageSource.gallery, imageQuality: 80)
                          .then((_image) {
                        setState(() {
                          image = File(_image!.path);
                          namePoster = _image.path.split('/').last;
                        });
                      });

                      urlPoster = await StorageService.uploadImagePoster(image);
                    },
                    child: Text('Pilih Poster Acara',
                        style: myTextTheme.bodyLarge!.copyWith(
                          color: customBlueDark,
                        )),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    namePoster,
                    style: myTextTheme.bodyLarge,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: customRedColor,
                        ),
                        onPressed: () async {
                          Webinar webinar = Webinar(
                              judul: _judulController.text,
                              penyelenggara: _penyelenggaraController.text,
                              deskripsi: _deskripsiController.text,
                              tglAcara: _tglAcaraController.text,
                              waktuAcara: _waktuAcaraController.text,
                              lokasiAcara: _lokasiAcaraController.text,
                              harga: _hargaController.text,
                              linkPendaftaran: _linkPendaftaranController.text,
                              contactPerson: _contactPersonController.text,
                              sosmed: _sosmedController.text,
                              benefit: _benefitController.text,
                              urlPoster: urlPoster,
                              kategori: dropDownValue,
                              isVerified: false);
                          await FirestoreService.addWebinar(webinar).then(
                              (value) => AuthServices.showSnackbar(
                                  'Berhasil Terikirim', context));
                        },
                        child: const Text(
                          'Kirim',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: customRedColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Batal',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _judulController.dispose();
    _penyelenggaraController.dispose();
    _deskripsiController.dispose();
    _benefitController.dispose();
    _tglAcaraController.dispose();
    _waktuAcaraController.dispose();
    _lokasiAcaraController.dispose();
    _sosmedController.dispose();
    _linkPendaftaranController.dispose();
    _hargaController.dispose();
    _contactPersonController.dispose();
    super.dispose();
  }
}
