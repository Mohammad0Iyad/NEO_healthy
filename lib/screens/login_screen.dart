import 'package:flutter/material.dart';
import 'package:neo/screens/signup_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            //ClipRRect(child: Image.asset('assets/images/logo0.png',height: 120,)),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo0.png'),
              radius: 140,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
                child: TextFormField(
                    decoration: InputDecoration(
              icon: const Icon(Icons.email),
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
            const SizedBox(
              height: 10,
            ),
            Container(
                child: TextFormField(
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.lock),
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
              onPressed: () {},
              child: Text(
                "login",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen, fixedSize: Size(320, 50)),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "or login usaing",
              style: TextStyle(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
