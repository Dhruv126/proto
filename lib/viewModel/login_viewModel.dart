import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:proto/services/navigation_service.dart';
import 'package:proto/services/route_service.dart';

class LoginViewModel extends GetxController {
  NavigationService navigationService = NavigationService();
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
