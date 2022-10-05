// ignore: file_names
import 'package:app/main.dart';
import 'package:app/widget/task-widget.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

class ListTaskWidget extends StatefulWidget {
  const ListTaskWidget(
      {super.key, required this.tasks, required this.removeTask, required this.updateTask});
  final List<Task> tasks;
  final Function removeTask;
  final Function updateTask;
  @override
  State<ListTaskWidget> createState() => ListTaskWidgetState();
}

class ListTaskWidgetState extends State<ListTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: widget.tasks
            .mapIndexed((index, element) =>
                TaskWidget(task: element, index: index, removeTask: widget.removeTask, updateTask: widget.updateTask))
            .toList(),
      ),
    );
  }
}
