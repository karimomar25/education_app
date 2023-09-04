import 'package:education_app/firebase_options.dart';
import 'package:education_app/screens/auth/login_screen.dart';
import 'package:education_app/screens/auth/signup_student_screen.dart';
import 'package:education_app/screens/auth/signup_teacher_screen.dart';
import 'package:education_app/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale("ar"),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      theme: ThemeData(
          fontFamily: "Poppins",
          primarySwatch: Colors.cyan,
          elevatedButtonTheme: const ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.cyan)))),
      home: const Directionality(
          textDirection: TextDirection.rtl, child: HomeScreen()),
      routes: {
        "loginscreen": (context) => const LoginScreen(),
        "signupteacher": (context) => const SignUpTeacherScreen(),
        "signupstudent": (context) => const SignUpStudentScreen(),
      },
    );
  }
}
