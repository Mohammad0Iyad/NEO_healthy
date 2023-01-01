import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

import 'firebase_auth_methods.dart';

class FirebaseStorageMethod {

  Future<void> uploadFile()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    var email = FirebaseAuth.instance.currentUser!.email;

    if (result != null) {
      PlatformFile fileBytes = result.files.first;
      String fileName = result.files.first.name;
      print("object11");
File file = File(result.files.single.path.toString());

      // Upload file
      var taskSnapshot = await FirebaseStorage.instance.ref('uploads/$email/Medical/$fileName').putFile(file);
var downloadURL =await taskSnapshot.ref.getDownloadURL();
      var userCredential=FirebaseAuth.instance.currentUser!;
      await FirebaseFirestore.instance
          .collection('User')
          .doc(userCredential.uid)
          .set({'file linke $fileName': downloadURL},SetOptions(merge: true));

    }

  }

}