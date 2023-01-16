import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:neo/screens/home/home_page.dart';
import 'package:neo/screens/login_screen.dart';
import 'package:neo/screens/signup_screen.dart';
import 'package:neo/screens/splash/body.dart';
import 'package:neo/services/firebase_auth_methods.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

// test Awf00
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) { FirebaseAuthMethods(FirebaseAuth.instance); },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Neo Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.green,
        ),
        home: HomePage(),
      ),
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
    return MultiProvider(providers: [

    ],child: MaterialApp(home:SplashPage() ),);
  }
}
