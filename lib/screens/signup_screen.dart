import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:neo/screens/login_screen.dart';
import 'package:neo/services/firebase_auth_methods.dart';
import 'package:validation_textformfield/validation_textformfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  get _isObscure => true;
  //
  // void dispse() {
  //   super.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  //   passwordConfirmController.dispose();
  //   nameController.dispose();
  //   userNameController.dispose();
  // }

  void signUpUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        name: nameController.text.trim(),
          context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Register ",
                  style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 12, 60, 14),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20), // Image border
                        child: SizedBox.fromSize(
                            size: const Size.fromRadius(48), // Image radius
                            child: Image.asset("assets/images/google.jpg",
                                fit: BoxFit.cover)),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20), // Image border
                        child: SizedBox.fromSize(
                            size: const Size.fromRadius(48), // Image radius
                            child: Image.asset("assets/images/face.png",
                                fit: BoxFit.cover)),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20), // Image border
                        child: SizedBox.fromSize(
                            size: const Size.fromRadius(48), // Image radius
                            child: Image.asset("assets/images/linked.png",
                                fit: BoxFit.cover)),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                  ],
                ),

                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Or register with Email ",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),

                const SizedBox(
                  height: 15,
                ),

                //////////////

                Padding(
                  padding: const EdgeInsets.only(left: 17, right: 17),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      labelText: 'Full Name',
                      hintText: 'Full Name',
                      prefixIcon: const Icon(Icons.person_outline_outlined),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17, right: 17),
                  child: TextFormField(
                    controller: userNameController,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      labelText: 'User Name ',
                      hintText: 'User Name',
                      prefixIcon: const Icon(Icons.person),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17, right: 17),
                  child: EmailValidationTextField(
                    whenTextFieldEmpty: "Please enter  email",
                    validatorMassage: "Please enter valid email",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      labelText: 'Email',
                      hintText: 'Enter Your Email ',
                      prefixIcon: const Icon(Icons.email_rounded),
                    ),
                    textEditingController: emailController,
                    onChanged: (value) {
                      // print(value);
                    },
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17, right: 17),
                  child: PassWordValidationTextFiled(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      labelText: 'Passwordd',
                      hintText: 'Enter  password',
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    lineIndicator: false,
                    passwordMinError: "Must be more than 5 charater",
                    hasPasswordEmpty: "Password is Empty",
                    passwordMaxError: "Password to long",
                    passWordUpperCaseError:
                        "at least one Uppercase (Capital)lette",
                    passWordDigitsCaseError: "at least one digit",
                    passwordLowercaseError: "at least one lowercase character",
                    passWordSpecialCharacters:
                        "at least one Special Characters",
                    obscureText: _isObscure,
                    scrollPadding: EdgeInsets.only(left: 60),
                    onChanged: (value) {
                      // print(value);
                    },
                    passTextEditingController: passwordController,
                    passwordMaxLength: 10,
                    passwordMinLength: 5,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 17, right: 17),
                  child: PassWordValidationTextFiled(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      labelText: 'Confirm Password',
                      hintText: 'Enter  password',
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    lineIndicator: false,
                    passwordMinError: "Must be more than 5 charater",
                    hasPasswordEmpty: "Password is Empty",
                    passwordMaxError: "Password to long",
                    passWordUpperCaseError:
                        "at least one Uppercase (Capital)lette",
                    passWordDigitsCaseError: "at least one digit",
                    passwordLowercaseError: "at least one lowercase character",
                    passWordSpecialCharacters:
                        "at least one Special Characters",
                    obscureText: _isObscure,
                    scrollPadding: EdgeInsets.only(left: 60),
                    onChanged: (value) {
                      // print(value);
                    },
                    passTextEditingController: passwordConfirmController,
                    passwordMaxLength: 10,
                    passwordMinLength: 5,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Alredy a member ?',
                        style: TextStyle(color: Colors.grey)),
                    TextButton(
                      child: const Text(
                        ' Login ',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogInScreen()),
                        );
                        //signup screen
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                Center(
                  child: MaterialButton(
                    onPressed: signUpUser

                    //  () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => CompletSecreen()),
                    // );

                    // },
                    ,
                    height: 50,
                    minWidth: 350,
                    color: Colors.lightGreen,
                    shape: const StadiumBorder(),
                    child: const Text(
                      "Register ",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
