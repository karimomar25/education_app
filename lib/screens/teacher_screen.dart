import 'package:flutter/material.dart';
import 'package:education_app/widgets/teacher_container.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.cyan.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "assets/images/maxresdefault-719x720-1.png",
                  height: 90,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                " , .....مرحبا أستاذ ",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TecherContiner(
                    text: " عدد الكورسات \n 0",
                  ),
                  SizedBox(width: 16),
                  TecherContiner(
                    text: "عدد الفيديوهات \n 0 ",
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TecherContiner(
                    text: "عدد المشتركين \n 0",
                  ),
                  SizedBox(width: 16),
                  TecherContiner(
                    text: "  عدد الامتحانات \n 0",
                  ),
                ],
              ),
              SizedBox(height: 24),
              Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () {
                        // أدخل الإجراء الذي تريده هنا لأضافة الفيديو
                      },
                      label: Text('أضافة فيديو'),
                      icon: Icon(Icons.video_call),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0), 
                        side: BorderSide(color: Colors.cyan, width: 2.0), 
  ),                      backgroundColor: Colors.cyan,
                      
                    ),
                    SizedBox(height: 16),
                    FloatingActionButton.extended(
                      onPressed: () {
                        // أدخل الإجراء الذي تريده هنا لأضافة الامتحان
                      },
                      label: Text('أضافة أمتحان'),
                      icon: Icon(Icons.quiz_rounded),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(40.0), 
    side: BorderSide(color: Colors.cyan, width: 2.0), 
  ),                      backgroundColor: Colors.cyan,
                    ),
                    SizedBox(height: 16),
                    FloatingActionButton.extended(
                      onPressed: () {
                        // أدخل الإجراء الذي تريده هنا لأضافة الكورس
                      },
                      label: Text('أضافة كورس'),
                      icon: Icon(Icons.video_collection_sharp),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0), 
                        side: BorderSide(color: Colors.cyan, width: 2.0), 
  ),                      backgroundColor: Colors.cyan,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
