import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> createUser(
    String uid,
    String username,
    String email,
    int age,
    double weight,
    double height,
    int daysPerWeek,
    int hoursPerDay,
  ) async {
    CollectionReference userCol = firestore.collection("users");
    userCol.doc(uid)
        .set({
          "username": username,
          "email": email,
          "age": age,
          "weight": weight,
          "height": height,
          "daysPerWeek": daysPerWeek,
          "hoursPerDay": hoursPerDay,
        },SetOptions(merge: true))
        .then((value) => print("user added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<DocumentSnapshot<Object?>> getMyDetails(String uid){
    CollectionReference userCol = firestore.collection("users");
    return userCol.doc(uid).get();
  }
}
