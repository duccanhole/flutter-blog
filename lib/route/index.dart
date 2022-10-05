import 'package:app/route/home-widget.dart';
import 'package:app/store/TaskModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../widget/control-button.dart';
import '../widget/list-task.dart';
import '../widget/text-flield-widget.dart';
import 'footer-bar.dart';
import 'header-bar.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});
  @override
  State<StatefulWidget> createState() => IndexPageState();
}

class IndexPageState extends State<StatefulWidget> {
  int currIndex = 0;
  // List<Task> tasks = Provider.of<TaskModel>(context, listen: false).getTask;

  addTask(String taskName) {
    // Task newTask = Task(taskName: taskName, isDone: false);
    Task newTask = Task(taskName: taskName, isDone: false);
    // setState(() {
    //   tasks.add(newTask);
    // });
    context().read<TaskModel>().add(newTask);
  }

  removeTask(int index) {
    // setState(() {
    //   tasks.removeAt(index);
    // });
    context().read<TaskModel>().removeAt(index);
  }

  updateTask(int index, bool val) {
    // setState(() {
    //   tasks[index].isDone = val;
    // });
    context().read<TaskModel>().setTaskDone(index, val);
  }

  hideTaskDone() {
    // setState(() {
    //   tasks = tasks.map((e) {
    //     if (e.isDone) e.isShow = false;
    //     return e;
    //   }).toList();
    // });
    context().read<TaskModel>().filterTask("hide-done");
  }

  showAll() {
    // setState(() {
    //   tasks = tasks.map((e) {
    //     e.isShow = true;
    //     return e;
    //   }).toList();
    // });
    context().read<TaskModel>().filterTask("show-all");
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      ControlButton(
        hideTaskDone: hideTaskDone,
        showAll: showAll,
      ),
      Expanded(
          flex: 2,
          child: ListTaskWidget(
              tasks: context.watch<TaskModel>().getTask,
              removeTask: removeTask,
              updateTask: updateTask)),
      TextFieldWidget(emitTask: addTask),
    ]);
  }
}
