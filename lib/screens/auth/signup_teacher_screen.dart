import 'package:education_app/generated/l10n.dart';
import 'package:education_app/widgets/button.dart';
import 'package:education_app/widgets/textfield.dart';
import 'package:flutter/material.dart';

class SignUpTeacherScreen extends StatelessWidget {
  const SignUpTeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.white,
          Colors.cyan.shade100,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Easy to learn, discover more skills",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Sign Up as a teacher",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextField(
                    text: "First Name",
                    width: MediaQuery.of(context).size.width / 2.2,
                  ),
                  CustomTextField(
                    text: "Last Name",
                    width: MediaQuery.of(context).size.width / 2.2,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextField(
                text: "Email",
                width: double.infinity,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextField(
                text: "Phone Numper",
                width: double.infinity,
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                  child: Button(
                text: "Sign Up",
                height: 50,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
