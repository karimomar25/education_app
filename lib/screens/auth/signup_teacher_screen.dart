import 'package:education_app/widgets/button.dart';
import 'package:education_app/widgets/textfield.dart';
import 'package:flutter/material.dart';

class SignUpTeacherScreen extends StatefulWidget {
  const SignUpTeacherScreen({super.key});

  @override
  State<SignUpTeacherScreen> createState() => _SignUpTeacherScreenState();
}

class _SignUpTeacherScreenState extends State<SignUpTeacherScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? firstName, lastName, email;
  var phoneNumper;
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
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "تواصل مع طلابك بكل سهولة ، سهل وبسيط وامن",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "تسجيل في التطبيق كمدرس",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextField(
                      onSaved: (value) {
                        lastName = value;
                      },
                      text: "الاسم الثاني",
                      width: MediaQuery.of(context).size.width / 2.2,
                    ),
                    CustomTextField(
                      onSaved: (value) {
                        firstName = value;
                      },
                      text: "الاسم الاول",
                      width: MediaQuery.of(context).size.width / 2.2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  onSaved: (value) {
                    email = value;
                  },
                  inputType: TextInputType.emailAddress,
                  text: "البريد الالكتروني",
                  width: double.infinity,
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  onSaved: (value) {
                    phoneNumper = value;
                  },
                  inputType: TextInputType.phone,
                  text: "رقم الهاتف",
                  width: double.infinity,
                ),
                SizedBox(
                  height: 16,
                ),
                Center(
                    child: Button(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  text: "تسجيل",
                  height: 50,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
