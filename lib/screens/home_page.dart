import 'package:flutter/material.dart';
import 'package:todoapp/components/task_box.dart';

import '../components/dialog.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = new TextEditingController();
  List tasks = [];
  void onChanged(bool? value, int index) {
    setState(() {
      tasks[index][1] = !tasks[index][1];
    });
  }

  void onAdd() {
    setState(() {
      tasks.add([_controller.text, false]);
      _controller.clear();
      onCancel();
    });
  }

  void onCancel() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 101, 94, 158),
        title: Center(child: Text("To Do List")),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: ((context) {
                return DialogBox(
                  controller: _controller,
                  onAdd: onAdd,
                  onCancel: onCancel,
                );
              }));
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 101, 94, 158),
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
