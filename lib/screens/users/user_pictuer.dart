import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class userPicture extends StatefulWidget {
  const userPicture({Key? key}) : super(key: key);

  @override
  State<userPicture> createState() => _userPictureState();
}

class _userPictureState extends State<userPicture> {
String  image_picker_Url=" ";
  void pickUploadImage() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 75,
        maxHeight: 512,
        maxWidth: 512);
    Reference ref = FirebaseStorage.instance.ref().child('profilepic.jpg');
    await  ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value) {
      print(value);
    });

  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
      GestureDetector(
        onTap: pickUploadImage,
      ),);
  }
}
