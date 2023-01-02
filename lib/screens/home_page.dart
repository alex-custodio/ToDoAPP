import 'package:flutter/material.dart';
import 'package:todoapp/components/task_box.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List tasks = [
    ['Task1', false],
    ['Task2', false],
  ];
  void onChanged(bool? value, int index) {
    setState(() {
      tasks[index][1] = !tasks[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5a5390),
        title: Center(child: Text("To Do List")),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: ((context, index) {
            return TaskBox(
              taskName: tasks[index][0],
              checkMarked: tasks[index][1],
              onChanged: (value) => onChanged(value, index),
            );
          })),
      backgroundColor: Color(0xff252242),
    );
  }
}
