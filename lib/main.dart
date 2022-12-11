import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:neo/screens/signup_screen.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neo           Demo',
      theme: ThemeData(

        primarySwatch: Colors.amber,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SignUpScreen();
  }
}
