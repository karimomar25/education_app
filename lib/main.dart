import 'package:education_app/generated/l10n.dart';
import 'package:education_app/screens/auth/login_screen.dart';
import 'package:education_app/screens/auth/signup_student_screen.dart';
import 'package:education_app/screens/auth/signup_teacher_screen.dart';
import 'package:education_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale("en"),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
          fontFamily: "Poppins",
          primarySwatch: Colors.cyan,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.cyan)))),
      home: HomeScreen(),
      routes: {
        "loginscreen": (context) => LoginScreen(),
        "signupteacher": (context) => SignUpTeacherScreen(),
        "signupstudent": (context) => SignUpStudentScreen(),
      },
    );
  }
}
