import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:neo/utils/showSnackBar.dart';

import '../screens/home/home_page.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;

  FirebaseAuthMethods(this._auth);

  // Email SignUp
  Future<void> signUpWithEmail(
      {required String email,
      required String password,
      required String name,
      required String username,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance
          .collection('User')
          .doc(userCredential.user?.uid)
          .set({
        'email': email.trim(),
        'password': password.trim(),
        'name': name.trim(),
        'id': userCredential.user?.uid.trim()
      });

      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      // await FirebaseFirestore.instance.collection('User').add({'email': email.trim(), 'password': password.trim()});

    }
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Name, email address, and profile photo URL
      final name = user.displayName;
      final email = user.email;
      final photoUrl = user.photoURL;

      // Check if user's email is verified
      final emailVerified = user.emailVerified;

      // The user's ID, unique to the Firebase project. Do NOT use this value to
      // authenticate with your backend server, if you have one. Use
      // User.getIdToken() instead.
      final uid = user.uid;
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
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
      }
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

//Google Signin
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        //crate a new credential
        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        // if (userCredential.user != null){
        //   if(userCredential.additionalUserInfo!.isNewUser){
        //
        //   }
        // }
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
