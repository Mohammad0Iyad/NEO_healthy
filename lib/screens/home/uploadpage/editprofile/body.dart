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

  final TextEditingController passwordConfirmController =
  TextEditingController();

  final TextEditingController nameController = TextEditingController();

  void updateUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).upDateemail(
        email: emailController.text,
        name: nameController.text,
        password: passwordController.text,
        context: context);

  }
   var imageUrl = '' ;
  image() async {
       User userCredential = FirebaseAuth.instance.currentUser!;

    var imageGet = await FirebaseFirestore.instance
        .collection('Users')
        .doc(userCredential.email)
        .snapshots()
       .listen((value) {
       imageUrl = value['profile photo'];
       print(imageUrl);
    });
    return imageUrl;
        }

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
              children: [
                Container(
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
                    image:  DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
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
                      onTap:
                      image
                      ,
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
                      setState(() {
                        nameController;
                      });
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
                    onChange: (value) { setState(() {
                      emailController;
                    });},
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
                    hint: "password",
                    onChange: (value) {
                      setState(() {
                     passwordController;
                    });},
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
                    onTap: updateUser,
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
