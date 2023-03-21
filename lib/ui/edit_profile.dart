import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/common/text_theme.dart';
import 'package:webinfo_senter/data/firebase/auth_service.dart';
import 'package:webinfo_senter/data/firebase/firestore_service.dart';
import 'package:webinfo_senter/data/firebase/storage_service.dart';
import 'package:webinfo_senter/provider/akun_provider.dart';
import 'package:webinfo_senter/widget/display_photo.dart';

class EditProfile extends StatefulWidget {
  static const routeName = '/edit_profile';

  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _fullnameController = TextEditingController();
  late File _image;
  late String urlProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Consumer<AkunProvider>(
              builder: (context, value, child) {
                final profileAkun = value.userAkun;
                _fullnameController.value =
                    TextEditingValue(text: profileAkun.nama);
                urlProfile = profileAkun.urlFotoProfil;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Edit Profile',
                      style: myTextTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipOval(
                          child: DisplayPhoto(
                            url: urlProfile,
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: customRedColor,
                          ),
                          onPressed: () async {
                            await ImagePicker()
                                .pickImage(
                                    source: ImageSource.gallery,
                                    imageQuality: 80)
                                .then((image) {
                              setState(() => _image = File(image!.path));
                            });

                            urlProfile =
                                await StorageService.uploadImageProfile(_image);
                          },
                          child: const Text(
                            'Update Foto Profil',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextField(
                      controller: _fullnameController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Nama Lengkap',
                        labelStyle: myTextTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: customRedColor,
                            ),
                            onPressed: () async {
                              await FirestoreService.updateDataAkun(
                                      urlProfile, _fullnameController.text)
                                  .then((value) {
                                AuthServices.showSnackbar(
                                    "Berhasil Merubah Profil", context);
                              });
                              value.updateProfile(
                                  _fullnameController.text, urlProfile);
                            },
                            child: const Text(
                              'Simpan',
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
                );
              },
            )),
      ),
    );
  }
}
