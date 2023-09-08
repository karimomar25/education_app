import 'package:education_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:education_app/screens/auth/login_screen.dart';
import 'package:education_app/screens/auth/signup_student_screen.dart';
import 'package:education_app/screens/auth/signup_teacher_screen.dart';
import 'package:education_app/screens/home_screen.dart';
import 'package:education_app/screens/main_teacher_screen.dart';
import 'package:education_app/widgets/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = SimpleBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
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
            textDirection: TextDirection.rtl, child: MainTeacherScreen()),
        routes: {
          "loginscreen": (context) => const LoginScreen(),
          "signupteacher": (context) => const SignUpTeacherScreen(),
          "signupstudent": (context) => const SignUpStudentScreen(),
          "studentscreen": (context) => const StudentScreen(),
          "teacherscreen": (context) => const TeacherScreen(),
        },
      ),
    );
  }
}
