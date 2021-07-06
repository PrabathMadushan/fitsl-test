import 'package:fitls/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;

  final AuthService authService = new AuthService();

  void googleLogin() async {
    setState(() {
      loading = true;
    });
    try {
      await authService.signWithGoogle();
      Navigator.pushNamed(context, '/home').then((value) => setState(() {
            loading = false;
          }));
    } catch (e) {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(79, 185, 188, 1)),
                  ),
                  Text(
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
            Container(
              child: Builder(
                builder: (context) {
                  if (loading) {
                    return SpinKitFadingCircle(
                      itemBuilder: (BuildContext context, int index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color: index.isEven
                                ? Color.fromRGBO(79, 185, 188, 1)
                                : Colors.black,
                          ),
                        );
                      },
                    );
                  } else {
                    return Column(
                      children: [
                        OutlinedButton.icon(
                          onPressed: googleLogin,
                          icon: FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.black,
                          ),
                          label: Text(
                            "Login With Google",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 50),
                            side: BorderSide(color: Colors.black, width: 1),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
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
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 50),
                            side: BorderSide(color: Colors.black, width: 1),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: Size.square(20),
                        ),
                        Text("Not a member? Sign Up")
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
