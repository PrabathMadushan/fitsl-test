import 'package:flutter/cupertino.dart';

class AppUser {
  int _id;
  String _name;

  AppUser(this._id, this._name);

  String get name => _name;

  int get id => _id;
}
