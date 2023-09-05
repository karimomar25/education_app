import 'package:appwrite/appwrite.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signUpStudent(
      {required String email,
      required dynamic password,
      required String firstName,
      required String lastName}) async {
    emit(AuthLoading());
    Client client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1') // Your Appwrite Endpoint
        .setProject('64f4b1309d579add11f3'); // Your project ID
    Account account = Account(client);
    try {
      // ignore: unused_local_variable
      final user = await account.create(
          userId: ID.unique(),
          email: email,
          password: password,
          name: "$firstName $lastName");
      Fluttertoast.showToast(
        timeInSecForIosWeb: 5,
        msg: "تم التسجيل بنجاح",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.cyan,
        textColor: Colors.white,
        fontSize: 20,
      );
      emit(AuthSuccess());
    } on AppwriteException catch (error) {
      Fluttertoast.showToast(
        timeInSecForIosWeb: 5,
        msg: error.message!,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.cyan,
        textColor: Colors.white,
        fontSize: 20,
      );
      emit(AuthFailure());
    } catch (e) {
      Fluttertoast.showToast(
          backgroundColor: Colors.cyan,
          toastLength: Toast.LENGTH_LONG,
          textColor: Colors.white,
          timeInSecForIosWeb: 5,
          fontSize: 20,
          msg: "تم التسجيل بنجاح");
      emit(AuthSuccess());
    }
  }

  Future<void> signUpTeacher(
      {required String email,
      required dynamic password,
      required String firstName,
      required String lastName}) async {
    emit(AuthLoading());
    Client client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1') // Your Appwrite Endpoint
        .setProject('64f4b1309d579add11f3'); // Your project ID
    Account account = Account(client);
    try {
      // ignore: unused_local_variable
      final user = await account.create(
          userId: ID.unique(),
          email: email,
          password: password,
          name: "$firstName $lastName");
      Fluttertoast.showToast(
        timeInSecForIosWeb: 5,
        msg: "تم التسجيل بنجاح",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.cyan,
        textColor: Colors.white,
        fontSize: 20,
      );
      emit(AuthSuccess());
    } on AppwriteException catch (error) {
      Fluttertoast.showToast(
        timeInSecForIosWeb: 5,
        msg: error.message!,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.cyan,
        textColor: Colors.white,
        fontSize: 20,
      );
      emit(AuthFailure());
    } catch (e) {
      Fluttertoast.showToast(
          backgroundColor: Colors.cyan,
          toastLength: Toast.LENGTH_LONG,
          textColor: Colors.white,
          timeInSecForIosWeb: 5,
          fontSize: 20,
          msg: "تم التسجيل بنجاح");
      emit(AuthSuccess());
    }
  }

  Future<void> loginUser({
    required String email,
    required dynamic password,
  }) async {
    emit(AuthLoading());
    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1') // Your API Endpoint
        .setProject('64f4b1309d579add11f3'); // Your project ID

    final account = Account(client);

    try {
      // ignore: unused_local_variable
      final session =
          await account.createEmailSession(email: email, password: password);
      Fluttertoast.showToast(
        timeInSecForIosWeb: 5,
        msg: "تم تسجيل الدخول بنجاح",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.cyan,
        textColor: Colors.white,
        fontSize: 20,
      );
      emit(AuthSuccess());
    } on AppwriteException catch (error) {
      Fluttertoast.showToast(
        timeInSecForIosWeb: 5,
        msg: error.message!,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.cyan,
        textColor: Colors.white,
        fontSize: 20,
      );
      emit(AuthFailure());
    } catch (e) {
      Fluttertoast.showToast(
          backgroundColor: Colors.cyan,
          toastLength: Toast.LENGTH_LONG,
          textColor: Colors.white,
          timeInSecForIosWeb: 5,
          fontSize: 20,
          msg: "حدث خطأ");
      emit(AuthFailure());
    }
  }
}
