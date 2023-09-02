import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.text,
      this.width,
      this.onSaved,
      this.onChanged,
      this.inputType});
  final String text;
  final double? width;
  final Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 70,
      child: TextFormField(
        keyboardType: inputType,
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
            hintTextDirection: TextDirection.rtl,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(24))),
      ),
    );
  }
}
