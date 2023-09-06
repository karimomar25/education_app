import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.text, required this.image});
  final String text, image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: Colors.cyan.shade200,
                offset: Offset(-2, 1))
          ],
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
              image: AssetImage("assets/images/images.jpeg"),
              fit: BoxFit.contain),
          gradient: LinearGradient(colors: [Colors.white, Colors.white])),
      child: Container(
        decoration: BoxDecoration(),
        child: Text(
          textAlign: TextAlign.center,
          text,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: Colors.cyan.shade900),
        ),
      ),
    );
  }
}
