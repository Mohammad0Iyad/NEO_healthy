import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'firebase_auth_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:neo/utils/showSnackBar.dart';
import 'package:firebase_storage_web/firebase_storage_web.dart';
import '../screens/home/home_page.dart';
class FirebaseStorageMethod {
  final storageRef = FirebaseStorage.instance.ref();
  late final mountainsRef = storageRef.child("mountains.jpg");
  final gsReference =
  FirebaseStorage.instance.refFromURL("gs://neo-0-4c500.appspot.com/UserImage/istockphoto-519527618-612x612.jpg");


}