import 'package:education_app/widgets/button.dart';
import 'package:education_app/widgets/snackbar.dart';
import 'package:education_app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
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
                    await loginUser(context);
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

  Future<void> loginUser(BuildContext context) async {
    isLoading = true;

    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1') // Your API Endpoint
        .setProject('64f4b1309d579add11f3'); // Your project ID

    final account = Account(client);

    try {
      final session =
          await account.createEmailSession(email: email, password: password);
      isLoading = false;
      Fluttertoast.showToast(
        timeInSecForIosWeb: 5,
        msg: "تم تسجيل الدخول بنجاح",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.cyan,
        textColor: Colors.white,
        fontSize: 20,
      );
    } on AppwriteException catch (error) {
      Fluttertoast.showToast(
        timeInSecForIosWeb: 5,
        msg: error.message!,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.cyan,
        textColor: Colors.white,
        fontSize: 20,
      );
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
          backgroundColor: Colors.cyan,
          toastLength: Toast.LENGTH_LONG,
          textColor: Colors.white,
          timeInSecForIosWeb: 5,
          fontSize: 20,
          msg: "حدث خطأ");
    }
  }
}
