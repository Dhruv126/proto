import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:proto/core/base_view_model.dart';
import 'package:proto/core/services/services.dart';

class SignupViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future signUp() async {
    print("====== > ${emailController.text} == ${passwordController.text}");
    Map<String, dynamic> userCredentials = {
      "e-mail": emailController.text,
      "username": nameController.text,
    };
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);

    saveUserInfo(userCredentials);

    emailController.clear();
    nameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    navigationService.replaceWith(AppRoutes.homeScreen);
  }

  Future saveUserInfo(Map<String, dynamic> userCredentials) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc()
        .set(userCredentials);
  }

  void navigateToLoginScreen() {
    navigationService.navigateTo(AppRoutes.loginScreen);
  }
}
