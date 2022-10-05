import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../store/TaskModel.dart';

class StatisticInfo extends StatelessWidget {
  const StatisticInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var taskStore = context.watch<TaskModel>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("Task you have done: ${taskStore.countTaskDone}",
                style: const TextStyle(fontSize: 20)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("Task remain: ${taskStore.countTaskRemain}",
                style: const TextStyle(fontSize: 20)),
          ),
        )
      ],
    );
  }
}
