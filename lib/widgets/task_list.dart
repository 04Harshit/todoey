import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey/models/taskData.dart';
import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  void initState() {
    Provider.of<TaskData>(context, listen: false).loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, value, child) => ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
            taskText: value.tasks[index].name,
            isChecked: value.tasks[index].isDone,
            checkboxCall: (done) {
              setState(() {
                value.updateTask(value.tasks[index]);
              });
            },
            onLongPress: () {
              setState(() {
                value.deleteTask(value.tasks[index]);
              });
            },
          );
        },
        itemCount: value.count(),
      ),
    );
  }
}
