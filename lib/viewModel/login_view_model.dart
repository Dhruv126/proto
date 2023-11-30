import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:proto/core/base_view_model.dart';
import 'package:proto/core/services/services.dart';

class LoginViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future login() async {
    UserCredential userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
    print("==== > ${userCredential}");
    navigationService.navigateTo(AppRoutes.homeScreen);
  }

  void navigateToSignupScreen() {
    navigationService.replaceWith(AppRoutes.signUpScreen);
  }
}
