import 'package:flutter/material.dart';
import 'package:todoapp/components/button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onAdd;
  VoidCallback onCancel;
  DialogBox({super.key, required this.controller, required this.onAdd, required this.onCancel});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 101, 94, 158),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Adicione uma nova tarefa",
              ),
              style: TextStyle(
                color: Colors.white,
              ),
              controller: controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(text: "Adicionar", onPressed: onAdd),
                const SizedBox(width: 8.0),
                Button(text: "Cancelar", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
