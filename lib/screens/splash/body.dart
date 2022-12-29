import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neo/screens/users/login_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LogInScreen()),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ///image
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo0.png'),
                radius: 140,
              ),
              SizedBox(
                height: 5,
              ),
              // * Name
              Text(
                "NEO HEALTHY ",
                style: TextStyle(fontSize: 25, color: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}
