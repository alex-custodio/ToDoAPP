import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  Button({
    super.key,
    required this.text,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Color.fromARGB(255, 178, 168, 255),
      child: Text(text),
      padding: EdgeInsets.all(10),
    );
  }
}
