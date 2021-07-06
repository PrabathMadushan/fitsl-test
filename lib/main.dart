import 'package:firebase_core/firebase_core.dart';
import 'package:fitls/screens/home/home_screen.dart';
import 'package:fitls/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final FirebaseAuth auth = FirebaseAuth.instance;




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/home":(context)=>HomeScreen(title: "Fitness SL")
      },
      home: LoginScreen(title: 'This is my first app'),
    );
  }
}