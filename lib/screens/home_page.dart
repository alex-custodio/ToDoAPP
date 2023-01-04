import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/components/task_box.dart';
import 'package:todoapp/data/database.dart';

import '../components/dialog.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('myBox');
  final _controller = new TextEditingController();
  ToDoDatabase db = new ToDoDatabase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") != null) {
      db.load();
    }
    super.initState();
  }

  void onChanged(bool? value, int index) {
    setState(() {
      db.tasks[index][1] = !db.tasks[index][1];
    });
    db.update();
  }

  void onAdd() {
    setState(() {
      db.tasks.add([_controller.text, false]);
      _controller.clear();
      onCancel();
    });
    db.update();
  }

  void onCancel() {
    Navigator.of(context).pop();
    _controller.clear();
  }

  void onDelete(int index) {
    setState(() {
      db.tasks.removeAt(index);
    });
    db.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 101, 94, 158),
        title: Center(child: Text("Coisas Para Fazer")),
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
          itemCount: db.tasks.length,
          itemBuilder: ((context, index) {
            return TaskBox(
              taskName: db.tasks[index][0],
              checkMarked: db.tasks[index][1],
              onChanged: (value) => onChanged(value, index),
              onDelete: (context) => onDelete(index),
            );
          })),
      backgroundColor: Color(0xff252242),
    );
  }
}
