import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProvider extends ChangeNotifier {
  String? user;

  void setuser(String? token) {
    user = token;
    notifyListeners();
  }

  String? getuser() => user;
}
