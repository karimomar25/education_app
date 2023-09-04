import 'package:appwrite/appwrite.dart';
import 'package:education_app/widgets/button.dart';
import 'package:education_app/widgets/snackbar.dart';
import 'package:education_app/widgets/textfield.dart';
import 'package:flutter/material.dart';

class SignUpStudentScreen extends StatefulWidget {
  const SignUpStudentScreen({super.key});

  @override
  State<SignUpStudentScreen> createState() => _SignUpStudentScreenState();
}

class _SignUpStudentScreenState extends State<SignUpStudentScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? firstName, lastName, email;
  // ignore: prefer_typing_uninitialized_variables
  var phoneNumper;
  // ignore: prefer_typing_uninitialized_variables
  var password;
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
                  "ابحث عن المدرس المناسب لك بسهولة كبيرة ، معنا لا تحمل هم التفوق ! ",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "تسجيل في التطبيق كطالب",
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
                    isLoading = true;
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                    final client = Client()
                        .setEndpoint(
                            'https://cloud.appwrite.io/v1') // Your Appwrite Endpoint
                        .setProject('64f4b1309d579add11f3'); // Your project ID
                    final account = Account(client);

                    try {
                      final user = await account.create(
                          userId: ID.unique(),
                          name: "$firstName $lastName",
                          email: email!,
                          password: password);
                      isLoading = false;
                    } catch (e) {
                      print(e);
                    }
                    snackBar("تم التسجيل بنحاج", context);
                    isLoading = false;
                    //    Navigator.pushNamed(context, "validation");
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
