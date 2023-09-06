import 'package:education_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:education_app/widgets/button.dart';
import 'package:education_app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpTeacherScreen extends StatefulWidget {
  const SignUpTeacherScreen({super.key});

  @override
  State<SignUpTeacherScreen> createState() => _SignUpTeacherScreenState();
}

class _SignUpTeacherScreenState extends State<SignUpTeacherScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? firstName, lastName, email;
  // ignore: prefer_typing_uninitialized_variables
  int? phoneNumper;
  // ignore: prefer_typing_uninitialized_variables
  dynamic password;
  bool isLoading = false;
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
          Navigator.pushReplacementNamed(context, "homescreen");
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
                    "تواصل مع طلابك بكل سهولة ، سهل وبسيط وامن",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "تسجيل في التطبيق كمدرس",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
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
                  const SizedBox(
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
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    obscureText: true,
                    onSaved: (value) {
                      password = value;
                    },
                    text: "كلمة السر",
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                      child: Button(
                    isLoading: isLoading,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                      try {
                        BlocProvider.of<AuthCubit>(context).signUpTeacher(
                            email: email!,
                            password: password,
                            firstName: firstName!,
                            lastName: lastName!);
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
                    text: "تسجيل",
                    height: 50,
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
