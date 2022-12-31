import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neo/screens/users/signup_screen.dart';
import 'package:neo/screens/splash/body.dart';
import 'package:neo/services/firebase_auth_methods.dart';

import '../home/home_page.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _isObscure = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void logInUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            //ClipRRect(child: Image.asset('assets/images/logo0.png',height: 120,)),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo0.png'),
              radius: 140,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: "Email",
                      hintText: "Example@Example.com",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Colors.green,
                          width: 1.0,
                        ),
                      ),
                    ))),
            SizedBox(
              height: 10,
            ),
            Container(
                child: TextFormField(
                    obscureText: _isObscure,
                    controller: passwordController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: "Password",
                      hintText: "8 Character at lest ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Colors.green,
                          width: 1.0,
                        ),
                      ),
                      suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          }),
                    ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Do not have an Account yet?',
                    style: TextStyle(color: Colors.grey)),
                TextButton(
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                    //signup screen
                  },
                )
              ],
            ),
            ElevatedButton(
              onPressed: logInUser,

              child: Text(
                "login",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen, fixedSize: Size(320, 50)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "or login using",
              style: TextStyle(color: Colors.green),
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
                        child: ElevatedButton(
                          onPressed: () {
                            FirebaseAuthMethods(FirebaseAuth.instance)
                                .signInWithGoogle(context);
                          },
                          child: Image.asset("assets/images/google.jpg",
                              fit: BoxFit.cover),
                        )),
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
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}