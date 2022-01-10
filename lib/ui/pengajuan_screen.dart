// import 'package:flutter/material.dart';
// import 'package:webinfo_senter/common/style.dart';
// import 'package:webinfo_senter/data/firebase/firestore_service.dart';
// import 'package:webinfo_senter/data/model/webinar.dart';


// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:path/path.dart' as Path;


// class FormPengajuan extends StatefulWidget {
//   static const routeName = '/form_pengajuan';

//   @override
//   _FormPengajuanState createState() => _FormPengajuanState();
// }

// class _FormPengajuanState extends State<FormPengajuan> {
//   final TextEditingController _judulController = TextEditingController();
//   final TextEditingController _penyelenggaraController =
//       TextEditingController();
//   final TextEditingController _deskripsiController = TextEditingController();
//   final TextEditingController _tglAcaraController = TextEditingController();
//   final TextEditingController _waktuAcaraController = TextEditingController();
//   final TextEditingController _hargaController = TextEditingController();
//   final TextEditingController _lokasiAcaraController = TextEditingController();
//   final TextEditingController _linkPendaftaranController =
//       TextEditingController();
//   final TextEditingController _contactPersonController =
//       TextEditingController();
//   final TextEditingController _sosmedController = TextEditingController();
//   final TextEditingController _benefitController = TextEditingController();
//   String dropDownValue = 'Pengembangan Diri';
//   late String urlPoster;

//   bool uploading = false;
//   double val = 0;
//   late CollectionReference imgRef;
//   late firebase_storage.Reference ref;

//   final List<File> _image = [];
//   final picker = ImagePicker();
//   @override


//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Add Image'),
//           actions: [
//             TextButton(
//                 onPressed: () {
//                   setState(() {
//                     uploading = true;
//                   });
//                   uploadFile().whenComplete(() => Navigator.of(context).pop());
//                 },
//                 child: const Text(
//                   'upload',
//                   style: TextStyle(color: Colors.white),
//                 ))
//           ],
//         ),
//         body: Stack(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(4),
//               child: GridView.builder(
//                   itemCount: _image.length + 1,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3),
//                   itemBuilder: (context, index) {
//                     return index == 0
//                         ? Center(
//                       child: IconButton(
//                           icon: const Icon(Icons.add),
//                           onPressed: () =>
//                           !uploading ? chooseImage() : null),
//                     )
//                         : Container(
//                       margin: const EdgeInsets.all(3),
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: FileImage(_image[index - 1]),
//                               fit: BoxFit.cover)),
//                     );
//                   }),
//             ),
//             uploading
//                 ? Center(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const Text(
//                       'uploading...',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     CircularProgressIndicator(
//                       value: val,
//                       valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
//                     )
//                   ],
//                 ))
//                 : Container(),

//             Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.symmetric(vertical: 50),
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Ajukan Webinar',
//                     style: styleRoboto.copyWith(
//                       fontSize: 24,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 TextFormField(
//                   controller: _judulController,
//                   decoration: InputDecoration(
//                     labelText: 'Judul Acara',
//                     border: OutlineInputBorder(),
//                   ),
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 TextFormField(
//                   controller: _penyelenggaraController,
//                   decoration: InputDecoration(
//                     labelText: 'Badan / Lembaga Penyelenggara',
//                     border: OutlineInputBorder(),
//                   ),
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 TextFormField(
//                   controller: _deskripsiController,
//                   maxLines: 5,
//                   decoration: InputDecoration(
//                     labelText: 'Deskripsi',
//                     border: OutlineInputBorder(),
//                     alignLabelWithHint: true,
//                   ),
//                   style: TextStyle(
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(right: 10),
//                       width: 170,
//                       child: TextFormField(
//                         controller: _tglAcaraController,
//                         decoration: InputDecoration(
//                           labelText: 'Tanggal Acara',
//                           hintText: 'Sabtu, 01 Januari 2021',
//                           border: OutlineInputBorder(),
//                         ),
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                     Container(
//                       width: 100,
//                       child: TextFormField(
//                         controller: _waktuAcaraController,
//                         decoration: InputDecoration(
//                           labelText: 'Waktu',
//                           hintText: '08:00',
//                           border: OutlineInputBorder(),
//                         ),
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 TextFormField(
//                   controller: _lokasiAcaraController,
//                   decoration: InputDecoration(
//                     labelText: 'Lokasi Acara',
//                     border: OutlineInputBorder(),
//                   ),
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 TextFormField(
//                   controller: _hargaController,
//                   decoration: InputDecoration(
//                     labelText: 'Harga Pendaftaran',
//                     border: OutlineInputBorder(),
//                   ),
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 TextFormField(
//                   controller: _linkPendaftaranController,
//                   decoration: InputDecoration(
//                     labelText: 'Link Pendaftaran',
//                     border: OutlineInputBorder(),
//                   ),
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 TextFormField(
//                   controller: _contactPersonController,
//                   decoration: InputDecoration(
//                     labelText: 'Contact Person',
//                     border: OutlineInputBorder(),
//                   ),
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 TextFormField(
//                   controller: _sosmedController,
//                   decoration: InputDecoration(
//                     labelText: 'Situs / Media Sosial',
//                     border: OutlineInputBorder(),
//                   ),
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 TextFormField(
//                   controller: _benefitController,
//                   maxLines: 5,
//                   decoration: InputDecoration(
//                     labelText: 'Benefit Acara',
//                     border: OutlineInputBorder(),
//                     alignLabelWithHint: true,
//                   ),
//                   style: TextStyle(
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 DropdownButton<String>(
//                   value: dropDownValue,
//                   icon: const Icon(Icons.arrow_drop_down),
//                   elevation: 16,
//                   underline: Container(
//                     height: 2,
//                     color: customRedColor,
//                   ),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       dropDownValue = newValue!;
//                     });
//                   },
//                   items: <String>[
//                     'Pengembangan Diri',
//                     'Religi',
//                     'Teknologi dan Informasi',
//                     'Ekonomi'
//                   ].map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 //Tambahkan disiniiii
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       alignment: Alignment.center,
//                       child: TextButton(
//                         style: TextButton.styleFrom(
//                           backgroundColor: customRedColor,
//                         ),
//                         onPressed: () {
//                           Webinar webinar = Webinar(
//                               judul: _judulController.text,
//                               penyelenggara: _penyelenggaraController.text,
//                               deskripsi: _deskripsiController.text,
//                               tglAcara: _tglAcaraController.text,
//                               waktuAcara: _waktuAcaraController.text,
//                               lokasiAcara: _lokasiAcaraController.text,
//                               harga: _hargaController.text,
//                               linkPendaftaran: _linkPendaftaranController.text,
//                               contactPerson: _contactPersonController.text,
//                               sosmed: _sosmedController.text,
//                               benefit: _benefitController.text,
//                               urlPoster: urlPoster,
//                               kategori: dropDownValue);
//                           FirestoreService.addWebinar(webinar);
//                         },
//                         child: Text(
//                           'Kirim',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10.0,
//                     ),
//                     Container(
//                       alignment: Alignment.center,
//                       child: TextButton(
//                         style: TextButton.styleFrom(
//                           backgroundColor: customRedColor,
//                         ),
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: Text(
//                           'Batal',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             )
//           ],
//         ));
//   }

//   chooseImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _image.add(File(pickedFile!.path));
//     });
//     if (pickedFile!.path == null) retrieveLostData();
//   }

//   Future<void> retrieveLostData() async {
//     final LostDataResponse response = await picker.retrieveLostData();
//     if (response.isEmpty) {
//       return;
//     }
//     if (response.file != null) {
//       setState(() {
//         _image.add(File(response.file!.path));
//       });
//     } else {
//       print(response.file);
//     }
//   }

//   Future uploadFile() async {
//     int i = 1;

//     for (var img in _image) {
//       setState(() {
//         val = i / _image.length;
//       });
//       ref = firebase_storage.FirebaseStorage.instance
//           .ref()
//           .child('images/${Path.basename(img.path)}');
//       await ref.putFile(img).whenComplete(() async {
//         await ref.getDownloadURL().then((value) {
//           imgRef.add({'url': value});
//           i++;
//         });
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     imgRef = FirebaseFirestore.instance.collection('imageURLs');
//   }
// }
