import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '';
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
    //Google Signin
    Future<void> signInWithGoogle(BuildContext context) async {
      try{
        final GoogleSignInAccount? googleUser =await GoogleSignIn().signIn();
        final GoogleSignInAuthentication? googleAuth=
            await googleUser?.authentication;
        if (googleAuth?.accessToken != null && googleAuth?.idToken !=null){
          //crate a new credential
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken
          );
          UserCredential userCredential =
              await _auth.signInWithCredential(credential);
          // if (userCredential.user != null){
          //   if(userCredential.additionalUserInfo!.isNewUser){
          //
          //   }
          // }
        }
      }on FirebaseAuthException catch(e){
        showSnackBar(context,e.message!);
      }
    }
  }
}
