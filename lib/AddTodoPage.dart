import 'package:app/HomePage.dart';
import 'package:flutter/material.dart';
import 'Services/Data.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});
  _AddTodoPage createState() => _AddTodoPage();
}

class _AddTodoPage extends State<AddTodoPage> {
  String title = "";
  String description = "";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Form(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              child: TextFormField(
                onChanged: (value) {
                  title = value;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    label: Text(
                      "Title",
                    ),
                    filled: false),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 150,
              width: 300,
              child: TextFormField(
                onChanged: (value) {
                  description = value;
                },
                maxLines: 5,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    label: Text(
                      "Description",
                    ),
                    fillColor: Colors.transparent),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
                child: TextButton(
              onPressed: () {
                print("Submit Pressed");
                Data().createTodos(title, description);
                Data().fetchTodos();
              },
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.greenAccent),
                child: Center(
                    child:
                        Text("Submit", style: TextStyle(color: Colors.white))),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
