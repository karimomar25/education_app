import 'package:education_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:education_app/widgets/button.dart';
import 'package:education_app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    this.initialEmail,
    this.initialPassword,
  });

  final String? initialEmail;
  final dynamic initialPassword;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  dynamic email, password;
  bool isLoading = false;
  bool? isTeacher;
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is AuthSuccess) {
          isLoading = false;
          setState(() {});

          if (isTeacher == true) {
            Navigator.pushReplacementNamed(context, "teacherscreen");
          } else if (isTeacher == false) {
            Navigator.pushReplacementNamed(context, "studentscreen");
          }
        } else {
          isLoading = false;
          setState(() {});
        }
      },
      child: Scaffold(
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
                    "سهل في التعلم ، بسيط في التواصل مع الكثير من المدرسين المتميزين",
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
                      initialValue: widget.initialEmail,
                      inputType: TextInputType.emailAddress,
                      onSaved: (value) {
                        email = value;
                      },
                      text: " البريد الالكتروني"),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                      initialValue: widget.initialPassword,
                      onSaved: (value) {
                        password = value;
                      },
                      obscureText: true,
                      text: "كلمة السر"),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    textDirection: TextDirection.rtl,
                    "من فضلك اختار انت مدرس ولا طالب قبل ما تدوس تسجيل دخول !!",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w900),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: ListTile(
                          title: Text(
                            "انا طالب",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          leading: Radio(
                              activeColor: Colors.cyan,
                              value: "انا طالب",
                              groupValue: selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value;
                                  isTeacher = false;
                                });
                              }),
                        ),
                      ),
                      Flexible(
                        child: ListTile(
                          title: Text(
                            "انا مدرس",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          leading: Radio(
                              activeColor: Colors.cyan,
                              value: "انا مدرس",
                              groupValue: selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value;
                                  isTeacher = true;
                                });
                              }),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Button(
                    isLoading: isLoading,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                      //Login method
                      try {
                        BlocProvider.of<AuthCubit>(context)
                            .loginUser(email: email, password: password);
                      } catch (e) {
                        Fluttertoast.showToast(
                            backgroundColor: Colors.cyan,
                            toastLength: Toast.LENGTH_LONG,
                            textColor: Colors.white,
                            timeInSecForIosWeb: 5,
                            fontSize: 20,
                            msg:
                                "لقد حدث خطأ ، من فضلك تأكد من ادخال البيانات بشكل صحيح");
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
      ),
    );
  }
}
