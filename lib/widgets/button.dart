import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        //  backgroundColor: Colors.cyan,
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontStyle: FontStyle.italic,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(400),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
