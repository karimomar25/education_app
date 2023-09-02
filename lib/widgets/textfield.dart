import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.text,
      this.width,
      this.onSaved,
      this.onChanged});
  final String text;
  final double? width;
  final Function(String?)? onSaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 55,
      child: TextFormField(
        onChanged: onChanged,
        onSaved: onSaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "Field is required";
          }
          return null;
        },
        decoration: InputDecoration(
            hintText: text,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(24))),
      ),
    );
  }
}
