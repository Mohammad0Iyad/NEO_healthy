import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:neo/utils/showSnackBar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;

  FirebaseAuthMethods(this._auth);

  // Email SignUp
  Future<void> signUpWithEmail({required String email,
    required String password,
    required BuildContext context}) async {


    // Email Login

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }

  }
  // EmailVerification
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent successfully');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
  //Email login
  Future<void> loginWithEmail(
      {required String email, required String password, required BuildContext context}) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (!_auth.currentUser!.emailVerified){
       await sendEmailVerification(context);
      }
    }on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
