import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fitls/services/auth.dart';
import 'package:fitls/services/firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService authService = new AuthService();
  final FirestoreService storeService = new FirestoreService();
  late FirebaseMessaging messaging;

  String username = '';
  int age = 0;
  double weight = 0;
  double height = 0;
  int daysPerWeek = 0;
  int hoursPerDay = 0;

  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerAge = TextEditingController();
  final TextEditingController _controllerWeight = TextEditingController();
  final TextEditingController _controllerHeight = TextEditingController();
  final TextEditingController _controllerDaysPerWeek = TextEditingController();
  final TextEditingController _controllerHoursPreDay = TextEditingController();


  @override
  void initState() {
    super.initState();
    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      print("m token:" + value.toString());
    });

    String? uid = authService.getCurrentUser()?.uid;
    if(uid!=null){
      storeService.getMyDetails(uid).then((value){
        String _username = value.get("username");
        int _age = value.get("age");
        double _weight = value.get("weight");
        double _height = value.get("height");
        int _daysPerWeek = value.get("daysPerWeek");
        int _hoursPerDay = value.get("hoursPerDay");
        print("xxxx:"+_username);
        setState(() {
          username=_username;
          age=_age;
          weight=_weight;
          height=_height;
          daysPerWeek=_daysPerWeek;
          hoursPerDay=_hoursPerDay;
        });
        setFieldValue(_controllerUserName, _username);
        setFieldValue(_controllerAge, _age.toString());
        setFieldValue(_controllerWeight, _weight.toString());
        setFieldValue(_controllerHeight, _height.toString());
        setFieldValue(_controllerDaysPerWeek, _daysPerWeek.toString());
        setFieldValue(_controllerHoursPreDay, _hoursPerDay.toString());

      });

    }
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.body);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Notification"),
              content: Text(event.notification!.body!),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }



  setFieldValue(TextEditingController controller,String value){
    controller.value = controller.value.copyWith(
      text: controller.text + value,
      selection: TextSelection.collapsed(offset: controller.value.selection.baseOffset + value.length,),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Welcome " +
              (authService.getCurrentUser()?.email ?? "not available")),
          SizedBox.fromSize(
            size: Size.square(20),
          ),Column(
            children: [
              createFormField("Username", _controllerUserName, TextInputType.text, (value) {
                    setState(() {
                      username=value;
                    });
              }),createFormField("Age", _controllerAge, TextInputType.number, (value) {
                setState(() {
                  age=int.parse(value);
                });

              }),createFormField("Weigh", _controllerWeight, TextInputType.number, (value) {
                setState(() {
                  weight=double.parse(value);
                });

              }),createFormField("Height", _controllerHeight, TextInputType.number, (value) {
                setState(() {
                  height=double.parse(value);
                });
              }),createFormField("Days per week", _controllerDaysPerWeek, TextInputType.number, (value) {
                setState(() {
                  daysPerWeek=int.parse(value);
                });

              }), createFormField("hours per day", _controllerHoursPreDay, TextInputType.number, (value) {
                setState(() {
                  hoursPerDay=int.parse(value);
                });
              }),
            ],
          ),

          SizedBox.fromSize(
            size: Size.square(20),
          ),
          OutlinedButton(
            onPressed: () {
              // new FirestoreService().createUser();
              String? uid = authService.getCurrentUser()?.uid;
              String? email = authService.getCurrentUser()?.email;
              if(uid!=null && email!=null){
                print(uid +":"+username+":"+age.toString()+":"+weight.toString()+":"+height.toString()+":"+daysPerWeek.toString()+":"+hoursPerDay.toString());
                storeService.createUser(uid, username, email, age, weight, height, daysPerWeek, hoursPerDay);
              }else{
                print("error");
              }

            },

            child: Text(
              "Submit",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),

            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
            ),
          )
        ],
      )),
    );
  }


  Widget createFormField (String label,dynamic value,TextInputType type,ValueChanged<String>? onChanged){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
      child: TextFormField(
        controller: value,
        decoration: InputDecoration(
            labelText: label,
            contentPadding: new EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            border: OutlineInputBorder()
        ),
        keyboardType: type,
        onChanged: onChanged,
      ),
    );
  }
}
