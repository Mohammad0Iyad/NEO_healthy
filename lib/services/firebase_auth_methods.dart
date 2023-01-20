import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:neo/utils/showSnackBar.dart';

import '../screens/home/home_page.dart';

class FirebaseAuthMethods extends ChangeNotifier{
  final FirebaseAuth _auth;

  FirebaseAuthMethods(this._auth);

    // Email SignUp
  Future<void> signUpWithEmail(
      {required String email, required String password, required String name, required BuildContext context}) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password,);
    final user = FirebaseAuth.instance.currentUser;
    await userCredential.user?.updateEmail(email);
    print("email:$email");
    await userCredential.user?.updateDisplayName(name);
    print("displayName:$name");
    print(email + name);
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user?.email)
          .set({
        'email': user?.email,
        'password': password.trim(),
        'name': name.trim(),
        'id':user?.uid,
        'profile photo':'https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/user-profile-icon.png',
      });
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
  Future<void> upDateName({
    required String name,
    required BuildContext context}) async {
    final email = FirebaseAuth.instance.currentUser?.email;
    final FirebaseAuth _auth = FirebaseAuth.instance;

    User? currentUser = await _auth.currentUser;
    currentUser?.updateDisplayName(name);
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(email)
          .set({
        'name': name,
      });
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
  }

