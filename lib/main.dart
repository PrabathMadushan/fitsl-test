import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'This is my first app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage("assets/wimage.jpg")),
                ],
              ),
              SizedBox.fromSize(
                size: Size.square(20),
              ),
              Container(
                child: Text(
                  "Welcome to",
                  style: TextStyle(fontSize: 32),
                ),
              ),
              SizedBox.fromSize(
                size: Size.square(3),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Fitness-SL",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,color: Color.fromRGBO(79, 185, 188, 1)),
                    ),Text(
                      " App",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox.fromSize(
                size: Size.square(5),
              ),
              Container(
                child: Text(
                  "Plan your workout instantly from the app",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                ),
              ),
              SizedBox.fromSize(
                size: Size.square(30),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  print("google sign in");
                },
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.black,
                ),
                label: Text(
                  "Login With Google",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  side: BorderSide(color: Colors.black, width: 1),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              SizedBox.fromSize(
                size: Size.square(10),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  print("google sign in");
                },
                icon: FaIcon(
                  FontAwesomeIcons.facebookF,
                  color: Colors.black,
                ),
                label: Text(
                  "Login With Facebook",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  side: BorderSide(color: Colors.black, width: 1),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              SizedBox.fromSize(
                size: Size.square(20),
              ),
              Text("Not a member? Sign Up")
            ],
          ),
        ),
      ),
    );
  }
}
