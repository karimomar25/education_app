import 'package:flutter/material.dart';
class MainTeacherScreen extends StatelessWidget {
  const MainTeacherScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person),
                        StudentName(
                          studentName: 'Aisha',
                        ),
                       
                      ],
                    ),
                  ],
                ),
        
          
         ]
          ),




        );
        
  }
}




class StudentName extends StatelessWidget {
  const StudentName({Key? key, required this.studentName}) : super(key: key);
  final String studentName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Hi ', style: Theme.of(context).textTheme.subtitle1),
        Text(studentName, style: Theme.of(context).textTheme.subtitle1),
      ],
    );
  }
}