import 'package:fitls/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService authService = new AuthService();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:Text("Welcome "+(authService.getCurrentUser()?.email ?? "not available"))
      ),
    );
  }
}