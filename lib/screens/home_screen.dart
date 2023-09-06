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
            //   textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      "assets/images/test.jpeg",
                      height: 40,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                //  textDirection: TextDirection.rtl,
                " , مرحبا كريم ",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                textDirection: TextDirection.rtl,
                "قم باختيار الصف الدراسي الخاص بك من القائمة الموجودة بالاسفل .",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                  child: GridView.builder(
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.pink[50],
                          child: Column(
                            children: [
                              Text("الصف الاول الاعدادي"),
                              Image.asset("assets/images/images.jpeg")
                            ],
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
