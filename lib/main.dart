import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Todo App',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData.dark(),
      // A widget which will be started on application startup
      home: HomePage(),
    );
  }
}

// important here : list can't be res[i]=result[i] as it will result in rangeerrror as
// size of res=[] is 0 or res=[{}] is 1, so we need to use .add() function , it will add
// elements in next index
