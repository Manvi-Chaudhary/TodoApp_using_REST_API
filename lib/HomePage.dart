import 'dart:convert';

import 'Providers/TodoProvider.dart';
import 'package:provider/provider.dart';
import 'package:app/AddTodoPage.dart';
import 'package:app/CustomModels/Task.dart';
import "package:flutter/material.dart";
import 'Services/Data.dart';
import 'package:provider/provider.dart';
import 'package:app/Providers/UserProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    Provider.of<TodoProvider>(context, listen: false).getres();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          TextButton.icon(
              onPressed: () {
                user.setuser(null);
              },
              icon: Icon(Icons.logout, color: Colors.white),
              label: Text(" ")),
        ],
      ),
      body: Consumer<TodoProvider>(builder: (context, value, child) {
        List<Task> res = value.getlist();
        return ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: Colors.grey.withOpacity(0.3),
                leading: Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.greenAccent,
                  value: res[index].completed,
                  onChanged: (value) async {
                    await Data().updateTodo(res[index].id, res[index].title,
                        res[index].description, value!);
                    Provider.of<TodoProvider>(context, listen: false).getres();
                  },
                ),
                trailing: TextButton.icon(
                    onPressed: () async {
                      await Data().deleteTodos(res[index].id);
                      Provider.of<TodoProvider>(context, listen: false)
                          .getres();
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    ),
                    label: Text("")),
                title: Text(res[index].title),
                subtitle: Text(res[index].description),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 5);
            },
            itemCount: res.length);
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTodoPage()));
        },
      ),
    );
  }
}
