import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    this.onTap,
    this.width,
    this.height,
    this.isLoading = false,
  });
  final String text;
  final void Function()? onTap;
  final double? width;
  final double? height;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(color: Colors.cyan, offset: Offset(1, -2), blurRadius: 5),
          BoxShadow(color: Colors.cyan, offset: Offset(-2, 1), blurRadius: 5)
        ], color: Colors.cyan, borderRadius: BorderRadius.circular(5)),
        child: isLoading
            ? const SizedBox(
                height: 24, width: 24, child: CircularProgressIndicator())
            : Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
