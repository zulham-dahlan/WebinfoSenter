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
  late File image ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Ajukan Webinar',
                    style: myTextTheme.headline6,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Judul Acara', style: myTextTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: _judulController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text('Badan / Lembaga Penyelenggara', style: myTextTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),),
                 SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: _penyelenggaraController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text('Deskripsi', style: myTextTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),),
                 SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: _deskripsiController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text('Tanggal & Waktu Acara', style: myTextTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Container(
                      
                      margin: EdgeInsets.only(right: 10),
                      width: 170,
                      child: TextFormField(
                        controller: _tglAcaraController,
                        decoration: InputDecoration(
                          hintText: '01 Januari 2021',
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: TextFormField(
                        controller: _waktuAcaraController,
                        decoration: InputDecoration(
                          hintText: '08:00',
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text('Lokasi Acara', style: myTextTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),),
                 SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: _lokasiAcaraController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text('Harga Pendaftaran', style: myTextTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),),
                 SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: _hargaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Free / Rp. -'
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text('Link Pendaftaran', style: myTextTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),),
                 SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: _linkPendaftaranController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text('Contact Person', style: myTextTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),),
                 SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: _contactPersonController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'ex. 085821212100'
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text('Situs / Media Sosial', style: myTextTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),),
                 SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: _sosmedController,
                  decoration: InputDecoration(
                    hintText: 'ex. @webinfosenter / www.webinfo.com',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text('Benefit Acara', style: myTextTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),),
                 SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: _benefitController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Text(
                      'Kategori : ',
                      style: myTextTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
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
                          child: Text(value, style: myTextTheme.bodyText1),
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
                                    source: ImageSource.gallery,
                                    imageQuality: 80)
                                .then((_image) {
                              setState(() { 
                                image = File(_image!.path);
                                namePoster = _image.path.split('/').last;
                                });
                            });
                            
                            urlPoster =
                                await StorageService.uploadImagePoster(image);
                           
                        },
                        child: Text('Pilih Poster Acara',
                            style: myTextTheme.bodyText1!.copyWith(
                              color: customBlueDark,
                            )),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left:20, right:20),
                      child: Text(
                        '$namePoster',
                        style: myTextTheme.bodyText1,
                      ),
                    ),
                  
                SizedBox(
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
                          await FirestoreService.addWebinar(webinar).then((value) => AuthServices.showSnackbar('Berhasil Terikirim', context));
                        },
                        child: const Text(
                          'Kirim',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
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
