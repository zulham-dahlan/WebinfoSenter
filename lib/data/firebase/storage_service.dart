import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService{
  static Future<String> uploadImageProfile(File file)async{
    String _imagePath = file.path.split('/').last;

    Reference ref = FirebaseStorage.instance.ref().child('avatar').child(_imagePath);
    UploadTask task = ref.putFile(file);
    TaskSnapshot snapshot = await task ;
    String _imgUrl = await snapshot.ref.getDownloadURL();
    return _imgUrl ;
  }

  static Future<String> uploadImagePoster(File file)async{
    String _imagePath = file.path.split('/').last;

    Reference ref = FirebaseStorage.instance.ref().child('images').child(_imagePath);
    UploadTask task = ref.putFile(file);
    TaskSnapshot snapshot = await task ;
    String _imgUrl = await snapshot.ref.getDownloadURL();
    return _imgUrl ;
  }
  
}