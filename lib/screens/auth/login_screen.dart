import 'package:education_app/widgets/button.dart';
import 'package:education_app/widgets/textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  dynamic phoneNumper, password;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "سهل في التعلم ، بسيط في التواصل ، مع الكثير من المدرسين المتميزين",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "تسجيل الدخول لحسابك",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                    onSaved: (value) {
                      phoneNumper = value;
                    },
                    text: "رقم الهاتف"),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                    onSaved: (value) {
                      password = value;
                    },
                    obscureText: true,
                    text: "كلمة السر"),
                const SizedBox(
                  height: 16,
                ),
                Button(
                  isLoading: isLoading,
                  onTap: () {
                    isLoading = true;
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  text: "تسجيل الدخول",
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
