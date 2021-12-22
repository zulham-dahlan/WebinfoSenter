import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/data/firebase/firestore_service.dart';
import 'package:webinfo_senter/data/model/akun.dart';
import 'package:webinfo_senter/ui/layout_navigation.dart';
import 'package:webinfo_senter/ui/login_page.dart';

class AuthServices{
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> signOut() async {
    _auth.signOut();
  }

  static Future<void> toLoginorHome(BuildContext context) async{
    _auth.authStateChanges().listen((User? user) {
      if(user == null){
        Navigator.pushNamed(context, LoginPage.routeName);
      }else{
        Navigator.pushNamed(context, LayoutNavigation.routeName);
      }
    });
  }

  static Future<void> lognIn(String email, String password, BuildContext context) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacementNamed(context, LayoutNavigation.routeName);
    }on FirebaseAuthException catch (e){
      if(e.code == 'user-not-found'){
        showSnackbar('Email tidak ditemukan', context);
      }else if(e.code == 'wrong-password'){
        showSnackbar('Password salah', context);
      }
    }catch (e){
      print(e);
    }
  }

  static Future<void> register(Akun akun, String password, BuildContext context) async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: akun.email, password: password);
      FirestoreService.addAkun(akun, userCredential.user!.uid.toString());
      showSnackbar('Registrasi Berhasil', context);
    }on FirebaseAuthException catch (e){
      if(e.code == 'weak-password'){
        showSnackbar('Password terlalu lemah', context);
      }else if(e.code == 'email-already-in-user'){
        showSnackbar('Email sudah digunakan', context);
      }
    }catch (e){
      print(e);
    }
  }

  static void showSnackbar(String message, BuildContext context){
    final snackbar = SnackBar(content: Text(message), backgroundColor: customRedColor,);
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static Future<String> getId() async {
    return await _auth.currentUser!.uid;
  }
}