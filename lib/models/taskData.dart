// ignore_for_file: file_names
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../database/local_storage.dart';
import 'task.dart';

LocalStorage lsd = LocalStorage();

class TaskData with ChangeNotifier {
  final _myBox = Hive.box('myBox');

  List tasks = [];

  int count() {
    return tasks.length;
  }

  void loadData() async {
    tasks = await _myBox.get('LSD') ?? [];
    notifyListeners();
  }

  void addTask(String newTaskTitle) {
    tasks.add(Task(name: newTaskTitle));
    lsd.updateData(tasks);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    lsd.updateData(tasks);
    notifyListeners();
  }

  void deleteTask(Task element) {
    tasks.remove(element);
    lsd.updateData(tasks);
    notifyListeners();
  }
}
