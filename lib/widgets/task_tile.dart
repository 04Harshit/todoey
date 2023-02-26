import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.taskText,
    required this.checkboxCall,
    required this.isChecked,
    required this.onLongPress,
  });
  final String taskText;
  final bool isChecked;
  final Function(bool?) checkboxCall;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 40),
          title: Text(
            taskText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              decoration: isChecked ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Checkbox(
            activeColor: Colors.blue,
            value: isChecked,
            onChanged: checkboxCall,
          )),
    );
  }
}
