import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/login_model.dart';

class LoginController extends GetxController{
  final LoginModel model = LoginModel();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Login method
  void login() {
    if (!model.isValidEmail(emailController.text)) {
      Get.dialog(
        AlertDialog(
          title: Text("Invalid Email"),
          content: Text("Please enter a valid email address."),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text("OK"),
            ),
          ],
        ),
      );
    } else {
      // Proceed with login
      Get.dialog(
        AlertDialog(
          title: Text("Valid Email"),
          content: Text("Login successful!"),
          actions: [
            TextButton(
              onPressed: (() => Get.toNamed('/firstpage')),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }
}