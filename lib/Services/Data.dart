import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class Data {
  String? uid;
  final uri = Uri.parse("https://api.nstack.in/v1/todos");

  Future createTodos(String title, String description) async {
    dynamic res = await http.post(uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "title": title,
          "description": description,
          "is_completed": false
        }));
    print(res.statusCode);

    final result = jsonDecode(res.body);
    print(result);
  }

  Future<List?> fetchTodos() async {
    dynamic res = await http.get(uri);
    if (res.statusCode == 200) {
      final result = jsonDecode(res.body);

      return result["items"] as List;
    } else {
      print(res.body);
      return null;
    }
  }

  Future deleteTodos(String id) async {
    dynamic res =
        await http.delete(Uri.parse("https://api.nstack.in/v1/todos/${id}"));
    print(res.statusCode);
    print(res.body);
  }

  Future updateTodo(
      String id, String title, String description, bool is_completed) async {
    dynamic res = await http.put(
        Uri.parse("https://api.nstack.in/v1/todos/${id}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "title": title,
          "description": description,
          "is_completed": is_completed
        }));
    print("h");
    print(res.body);
  }
}
