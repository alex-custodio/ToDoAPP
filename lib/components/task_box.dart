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
            Checkbox(
              value: checkMarked,
              onChanged: onChanged,
              activeColor: Color.fromARGB(255, 240, 190, 82),
              side: MaterialStateBorderSide.resolveWith(
                  (states) => BorderSide(width: 1.5, color: Color.fromARGB(255, 240, 190, 82)),
              ),
            ),
            Text(
              taskName,
              style: TextStyle(
                  color: Colors.white,
                  decoration: checkMarked!
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Color.fromARGB(255, 240, 190, 82),
                  decorationThickness: 5),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 72, 64, 118),
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
