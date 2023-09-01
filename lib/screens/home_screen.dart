import 'package:education_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 77,
          ),
          Image.asset('assets/images/maxresdefault-719x720-1.png'),
          const SizedBox(
            height: 40,
          ),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'اهلا بكم في تعليم اونلاين',
                textStyle: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            totalRepeatCount: 4,
            // pause: const Duration(milliseconds: 1000),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
          const SizedBox(
            height: 33,
          ),
          SizedBox(
              width: 250.0,
              height: 60.0,
              child: Button(
                  onPressed: () {
                    Navigator.pushNamed(context, "signupscreen");
                  },
                  text: "انشاء حساب مدرس")),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
              width: 250.0,
              height: 60.0,
              child: Button(
                  onPressed: () {
                    Navigator.pushNamed(context, "signupscreen");
                  },
                  text: "انشاء حساب طالب")),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "loginscreen");
                },
                child: Text(
                  "اضغط هنا",
                  style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                " لديك حساب بالفعل؟ ",
                style: TextStyle(fontSize: 20),
              ),
            ],
          )
        ],
      ),
    );
  }
}
