import 'package:app/route/index.dart';
import 'package:app/store/TaskModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Task {
  String taskName;
  bool isDone;
  bool isShow;
  Task({
    this.taskName = "",
    this.isDone = false,
    this.isShow = true
  });
}
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TaskModel())
    ],
    child: const HomeWidget(),
  ));
}

