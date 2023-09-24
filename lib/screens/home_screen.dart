import 'package:education_app/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.white,
          Colors.cyan.shade100,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      "assets/images/test.jpeg",
                      height: 40,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                //  textDirection: TextDirection.rtl,
                " , مرحبا كريم ",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                textDirection: TextDirection.rtl,
                "قم باختيار الصف الدراسي الخاص بك من القائمة الموجودة بالاسفل .",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                  child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 30,
                    crossAxisCount: 2),
                children: const [
                  CustomContainer(
                      text: "الصف الاول الاعدادي",
                      image: "assets/images/images.jpeg"),
                  CustomContainer(
                      text: "الصف الثاني الاعدادي",
                      image: "assets/images/images.jpeg"),
                  CustomContainer(
                      text: "الصف الثالث الاعدادي",
                      image: "assets/images/images.jpeg"),
                  CustomContainer(
                      text: "الصف الاول الثانوي",
                      image: "assets/images/images.jpeg"),
                  CustomContainer(
                      text: "الصف الثاني الثانوي",
                      image: "assets/images/images.jpeg"),
                  CustomContainer(
                      text: "الصف الثالث الثانوي",
                      image: "assets/images/images.jpeg"),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
