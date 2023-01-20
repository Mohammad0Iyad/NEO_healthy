import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:neo/screens/home/uploadpage/editprofile/cum_textform.dart';
import 'package:neo/screens/home/widgets/appbarpage/body.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:neo/services/firebase_auth_methods.dart';
import 'package:neo/services/firebase_storge.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();
  User userCredential = FirebaseAuth.instance.currentUser!;

  void updateUserInfo() async{

    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.email)
          .update({
        'name': nameController.text.trim(),
        'password': passwordController.text.trim(),
        'email': emailController.text.trim()
      });
    }
    catch (e){print('no method');}
  }



  // var imageUrl = '';
  //
  // image() async {
  //   User userCredential = FirebaseAuth.instance.currentUser!;
  //
  //   var imageGet = await FirebaseFirestore.instance
  //       .collection('Users')
  //       .doc(userCredential.email)
  //       .snapshots()
  //       .listen((value) {
  //         if (value != null) {
  //           imageUrl = value['profile photo'];
  //         }else {
  //           imageUrl = 'https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=1024x1024&w=is&k=20&c=-mUWsTSENkugJ3qs5covpaj-bhYpxXY-v9RDpzsw504=';
  //         }
  //   });
  //   return NetworkImage(imageUrl);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMain(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Stack(
              children:
              [

                StreamBuilder( stream: FirebaseStorageMethod().getsnap(),
            builder: (context,  snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              var image=snapshot.data!["profile photo"];
              return Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(

                    image: NetworkImage('$image'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: Colors.white,
                        ),
                        color: Colors.green),
                    child: InkWell(
                      onTap: FirebaseStorageMethod().setPictureProfile,
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustTextFormSign(
                    hint: "Name",
                    onChange: (value) {
                      if (value !=null){
                        nameController.text = value! ;
                      }else if (value ==null){
  FirebaseFirestore.instance
        .collection('Users')
        .doc(userCredential.email)
        .set({'name':userCredential.email});
  nameController.text = userCredential.email!;
                      }
                    },
                    valid: (value) {
                      if (value!.isEmpty) {
                        return 'must be empty';
                      }
                      return null;
                    },
                    prefIcon: const Icon(Icons.person),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustTextFormSign(
                    hint: "e-mail",
                    onChange: (value) {
                      setState(() {
                        emailController.text = value! ;
                      });
                    },
                    valid: (value) {
                      if (value!.isEmpty) {
                        return 'must be empty';
                      }
                      return null;
                    },
                    prefIcon: const Icon(Icons.email),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustTextFormSign(
                    hint: "password",
                    onChange: (value) {
                      setState(() {
                        passwordController.text = value! ;
                      });
                    },
                    valid: (value) {
                      if (value!.isEmpty) {
                        return 'must be empty';
                      }
                      return null;
                    },
                    prefIcon: const Icon(Icons.email),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustTextFormSign(
                    hint: "Birth date",
                    onChange: (value) {},
                    valid: (value) {
                      if (value!.isEmpty) {
                        return 'must be empty';
                      }
                      return null;
                    },
                    prefIcon: const Icon(Icons.date_range),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustTextFormSign(
                    hint: "Occupation",
                    onChange: (value) {},
                    valid: (value) {
                      if (value!.isEmpty) {
                        return 'must be empty';
                      }
                      return null;
                    },
                    prefIcon: const Icon(Icons.g_mobiledata),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: updateUserInfo,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff76B947),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 50,
                      width: double.infinity,
                      child: Center(
                          child: Text(
                        "Update",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
