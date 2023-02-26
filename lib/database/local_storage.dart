import 'package:hive/hive.dart';
import 'package:todoey/models/taskData.dart';

class LocalStorage {
  final _myBox = Hive.box('myBox');

  updateData(List tasks) async {
    await _myBox.put('LSD', tasks);
  }
}
