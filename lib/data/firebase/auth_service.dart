import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        final snackbar = SnackBar(content: Text('Email tidak ditemukan'));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }else if(e.code == 'wrong-password'){
        final snackbar = SnackBar(content: Text('Password salah'));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    }catch (e){
      print(e);
    }
  }

  static Future<void> register(Akun akun, String password, BuildContext context) async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: akun.email, password: password);
      FirestoreService.addAkun(akun, userCredential.user!.uid.toString());
      final snackbar = SnackBar(content: Text('Registrasi Berhasil'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }on FirebaseAuthException catch (e){
      if(e.code == 'weak-password'){
        final snackbar = SnackBar(content: Text('Password terlalu lemah'));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }else if(e.code == 'email-already-in-user'){
        final snackbar = SnackBar(content: Text('Email sudah digunakan'));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    }catch (e){
      print(e);
    }
  }

  static Future<String> getId() async {
    return await _auth.currentUser!.uid;
  }

}