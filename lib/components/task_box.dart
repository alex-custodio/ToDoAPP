import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 72, 64, 118),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Checkbox(
              value: checkMarked,
              onChanged: onChanged,
              activeColor: const Color.fromARGB(255, 178, 168, 255),
              side: MaterialStateBorderSide.resolveWith(
                  (states) => const BorderSide(width: 1.5, color: Color.fromARGB(255, 178, 168, 255)),
              ),
            ),
            Text(
              taskName,
              style: TextStyle(
                  color: checkMarked! ? Colors.grey : Colors.white,
                  decoration: checkMarked!
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Color.fromARGB(255, 178, 168, 255),
                  decorationThickness: 5),
            )
          ],
        ),
      ),
    );
  }
}
