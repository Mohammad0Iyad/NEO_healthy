import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:neo/utils/showSnackBar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;

  FirebaseAuthMethods(this._auth);

  // Email SignUp
  Future<void> signUpWithEmail(
      {required String email, required String password, required BuildContext context})
  async{
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e) {
      if(e.code == 'weak password'){
        showSnackBar(context, e.message!);
      }

    }
  }

}
