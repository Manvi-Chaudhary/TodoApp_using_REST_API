import 'package:app/Providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:app/Services/Auth.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  final Function toggle;
  const SignUp({Key? key, required this.toggle}) : super(key: key);
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "";
  String password = "";
  String username = "";
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
        body: Form(
            key: _formkey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                    validator: ((value) {
                      return (value!.isEmpty)
                          ? "Please enter a valid email"
                          : null;
                    }),
                    onChanged: (val) {
                      email = val;
                    },
                    decoration: InputDecoration(
                        hintText: 'Enter Email',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                                style: BorderStyle.solid)))),
              ),
              SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  validator: ((value) {
                    return (value!.isEmpty) ? "Please enter a Password" : null;
                  }),
                  onChanged: (val) {
                    password = val;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Enter Password',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                              style: BorderStyle.solid))),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  validator: ((value) {
                    return (value!.isEmpty) ? "Please enter a Username" : null;
                  }),
                  onChanged: (val) {
                    username = val;
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter Username',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                              style: BorderStyle.solid))),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Already have an account? "),
                  TextButton(
                      onPressed: () {
                        widget.toggle();
                      },
                      child: Text(
                        "Sign in",
                      ))
                ],
              ),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      dynamic res = await Auth().signup(email, password);
                      if (res != null) {
                        user.setuser(res);
                      }
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.zero,
                        border: Border.all(
                            color: Colors.black,
                            width: 2,
                            style: BorderStyle.solid)),
                    height: 50,
                    width: 160,
                    child: Center(
                      child: Text("Create",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ))
            ])));
  } //mmm
}
