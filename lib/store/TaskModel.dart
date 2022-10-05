import 'dart:collection';

import 'package:app/main.dart';
import 'package:flutter/material.dart';

class TaskModel extends ChangeNotifier {
  List<Task> tasks = [];

  List<Task> get getTask => tasks;

  int get countTaskDone => tasks.where((element) => element.isDone).length;

  int get countTaskRemain =>
      tasks.where(((element) => element.isDone == false)).length;

  void add(Task item) {
    tasks.add(item);
    notifyListeners();
  }

  void removeAt(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  void setVisible(int index, bool val) {
    tasks[index].isShow = val;
    notifyListeners();
  }

  void setTaskDone(int index, bool val) {
    tasks[index].isDone = val;
    notifyListeners();
  }

  void filterTask(String action) {
    switch (action) {
      case "show-all":
        tasks = tasks.map((e) {
          e.isShow = true;
          return e;
        }).toList();
        break;
      case "remove-all":
        tasks = [];
        break;
      case "hide-done":
        tasks = tasks.map((e) {
          if (e.isDone) e.isShow = false;
          return e;
        }).toList();
        break;
      default:
    }
    notifyListeners();
  }
}
