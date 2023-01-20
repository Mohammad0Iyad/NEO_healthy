import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class FirebaseStorageMethod {
  Future<String> downloadDiet() async {
    var email = FirebaseAuth.instance.currentUser!.email;
    var taskSnapshot = await FirebaseStorage.instance
        .ref('uploads/$email/Diet/').getDownloadURL();

    return taskSnapshot;

  }

  Future<void> uploadFileRequiredChecks() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    var email = FirebaseAuth.instance.currentUser!.email;

    if (result != null) {
      PlatformFile fileBytes = result.files.first;
      String fileName = result.files.first.name;

      File file = File(result.files.single.path.toString());

      // Upload file
      var taskSnapshot = await FirebaseStorage.instance
          .ref('uploads/$email/RequiredChecks/$fileName')
          .putFile(file);
      var downloadURL = await taskSnapshot.ref.getDownloadURL();
      var userCredential = FirebaseAuth.instance.currentUser!;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.email)
          .set({'RequiredChecks $fileName': downloadURL},
              SetOptions(merge: true));
    }
  }

  Future<void> uploadFileMedicalExaminations() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    var email = FirebaseAuth.instance.currentUser!.email;

    if (result != null) {
      // PlatformFile fileBytes = result.files.first;
      String fileName = result.files.first.name;

      File file = File(result.files.single.path.toString());

      // Upload file
      var taskSnapshot = await FirebaseStorage.instance
          .ref('uploads/$email/Medical Examinations/$fileName')
          .putFile(file);
      var downloadURL = await taskSnapshot.ref.getDownloadURL();
      var userCredential = FirebaseAuth.instance.currentUser!;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.email)
          .set({'Medical Examinations $fileName': downloadURL},
              SetOptions(merge: true));
    }
  }

  Future<void> setPictureProfile() async {
    final ImagePicker _picker = ImagePicker();
    late String downloadURL;
    var email = FirebaseAuth.instance.currentUser!.email;
    User userCredential = FirebaseAuth.instance.currentUser!;
    if (_picker != null) {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      File file = File(image!.path);
      File fileName = File(image.name.toString());

      var taskSnapshot = await FirebaseStorage.instance
          .ref('uploads/$email/photo/$fileName')
          .putFile(file);
      downloadURL = await taskSnapshot.ref.getDownloadURL();
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.email)
          .set({'profile photo': downloadURL},
              SetOptions(merge: true)).whenComplete(() => downloadURL);
      print(downloadURL);
    }
  }

  DocumentReference instance = FirebaseFirestore.instance
      .collection("Users")
      .doc(FirebaseAuth.instance.currentUser!.email);

  Stream<DocumentSnapshot> getsnap() {
    return instance.snapshots();
  }

//
// Future<void> getPictureProfile() async {
//   var email = FirebaseAuth.instance.currentUser!.email;
//   User userCredential = FirebaseAuth.instance.currentUser!;
//   var imageUrl1 = setPictureProfile;
//   print(imageUrl1);
//
//   var imageGet = await FirebaseFirestore.instance
//       .collection('Users')
//       .doc(userCredential.email)
//       .get()
//  .then((value) => value['profile photo']);
// }
//   Future<void> setPicture() async {
//     var email = FirebaseAuth.instance.currentUser!.email;
//     var userCredential = FirebaseAuth.instance.currentUser!;
//     File _imageFile;
//     final picker = ImagePicker();
//
//     final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     _imageFile = File(pickedFile!.path.trim());
//
//     Reference firebaseStorageRef = FirebaseStorage.instance
//         .ref()
//         .child('uploads/$email/profile Photo /$_imageFile');
//     UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
//     TaskSnapshot taskSnapshot = await uploadTask.snapshot;
//     taskSnapshot.ref.getDownloadURL().then(
//           (value) => print("Done: $value"),
//     );
// }
}
