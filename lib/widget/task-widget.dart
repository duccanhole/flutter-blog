// ignore: file_names
import 'package:app/main.dart';
import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget(
      {required this.task,
      required this.index,
      required this.removeTask,
      required this.updateTask,
      super.key});

  final Task task;
  final int index;
  final Function removeTask;
  final Function updateTask;

  @override
  State<TaskWidget> createState() => TaskWidgetState();
}

class TaskWidgetState extends State<TaskWidget> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: widget.task.isShow,
        child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: [
                Checkbox(
                    value: isDone,
                    shape: const CircleBorder(),
                    onChanged: (bool? val) {
                      setState(() {
                        isDone = val!;
                      });
                      widget.updateTask(widget.index, val);
                    }),
                Expanded(
                    flex: 2,
                    child: Text(widget.task.taskName,
                        style: TextStyle(
                            fontSize: 16,
                            decoration: isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none))),
                IconButton(
                    onPressed: () => widget.removeTask(widget.index),
                    icon: const Icon(Icons.delete, color: Colors.redAccent))
              ],
            )));
  }
}
