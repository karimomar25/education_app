import 'package:flutter/material.dart';

class TecherContiner extends StatelessWidget {
  const TecherContiner({
    Key? key,
    required this.text,
   // required this.number,
    
  }) : super(key: key);

  final String text; 
  //number;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 5, // You can adjust the elevation as needed
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
         width: 150, 
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(colors: [Colors.white, Colors.white]),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.cyan.shade200,
                offset: Offset(-2, 1),
              )
            ],
          ),
          child: Container(
            decoration: BoxDecoration(),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Colors.cyan.shade900,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
