import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';

class FormPengajuan extends StatefulWidget {
  static const routeName = '/form_pengajuan';

  @override
  _FormPengajuanState createState() => _FormPengajuanState();
}

class _FormPengajuanState extends State<FormPengajuan> {
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
                    style: styleRobotoTitle,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Judul Acara',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Badan / Lembaga Penyelenggara',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Deskripsi',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 170,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Tanggal Acara',
                          hintText: '01 Januari 2021',
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Waktu',
                          hintText: '08:00',
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Lokasi Acara',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Harga Pendaftaran',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Link Pendaftaran',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Contact Person',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Situs / Media Sosial',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Benefit Acara',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: customRedColor,
                        ),
                        onPressed: () {
                          
                        },
                        child: Text(
                          'Kirim',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: customRedColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
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
}
