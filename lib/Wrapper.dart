import 'package:app/Authenticate/Authenticate.dart';
import 'package:app/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/Providers/UserProvider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return (user.user == null) ? Authenticate() : HomePage();
  }
} //
