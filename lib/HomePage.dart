import 'dart:convert';

import 'package:app/AddTodoPage.dart';
import 'package:app/CustomModels/Task.dart';
import "package:flutter/material.dart";
import 'Services/Data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var res = <Map>[
    {
      "title": "Add a task",
      "description": "Add description",
      "is_completed": false
    },
  ];

  void initState() {
    super.initState();
    setres();
  }

  Future setres() async {
    final result = await Data().fetchTodos();

    if (result != null) {
      print("this");
      print(result);
      // important here : list can't be res[i]=result[i] as it will result in rangeerrror as
      // size of res=[] is 0 or res=[{}] is 1, so we need to use .add() function , it will add
      // elements in next index
      res.clear();
      print(res);
      int i = 0;
      while (i < result.length) {
        var map = {};
        map = result[i] as Map;
        try {
          res.add(map);
        } catch (e) {
          print(e.toString());
        }

        i++;
      }
      setState(() {});
    } else {
      print("result is empty");
    }
  }

  List<bool> is_completed = [];

  @override
  Widget build(BuildContext context) {
    print(res);

    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              tileColor: Colors.grey.withOpacity(0.3),
              leading: Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.greenAccent,
                value: res[index]["is_completed"],
                onChanged: (value) {
                  print(res[index]["description"]);
                  print(!res[index]["is_completed"]);
                  Data().updateTodo(res[index]["_id"], res[index]["title"],
                      res[index]["description"], value!);

                  setState(() {});
                },
              ),
              trailing: TextButton.icon(
                  onPressed: () {
                    Data().deleteTodos(res[index]["_id"]);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                  label: Text("")),
              title: Text(res[index]["title"]),
              subtitle: Text(res[index]["description"]),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 5);
          },
          itemCount: res.length),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          setres();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTodoPage()));
        },
      ),
    );
  }
}
