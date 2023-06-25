import "package:app/CustomModels/Task.dart";
import "package:app/Services/Data.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class TodoProvider extends ChangeNotifier {
  List<Task> res = [];

  List<Task> getlist() => res;

  Future getres() async {
    List? s = await Data().fetchTodos();

    if (s != null) {
      List<Map> s1 = [];
      for (int i = 0; i < s.length; i++) {
        Map item = s[i] as Map;
        s1.add(item);
      }

      res = s1
          .map((e) => Task(
              id: e["_id"],
              title: e["title"],
              description: e["description"],
              completed: e["is_completed"]))
          .toList();
    }
    notifyListeners();
  }
}
