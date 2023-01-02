import 'package:flutter/material.dart';

class TaskBox extends StatelessWidget {
  String taskName;
  bool? checkMarked;
  Function(bool?)? onChanged;

  TaskBox({
    super.key,
    required this.taskName,
    required this.checkMarked,
    required this.onChanged,
    
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Container(
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            Checkbox(value: checkMarked, onChanged: onChanged),
            Text(taskName, style: TextStyle(color: Colors.white),)
          ],
        ),
        decoration: BoxDecoration(
            color: Color(0xff5a5390), borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
