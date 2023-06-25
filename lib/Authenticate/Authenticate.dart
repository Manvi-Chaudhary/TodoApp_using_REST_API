import 'package:app/Authenticate/SignIn.dart';
import 'package:app/Authenticate/SignUp.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool signin = true;

  void toggleview() {
    setState(() {
      signin = !signin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (signin) ? SignIn(toggle: toggleview) : SignUp(toggle: toggleview);
  }
}
