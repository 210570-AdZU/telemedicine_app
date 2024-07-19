import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/register_model.dart';

class RegisterController extends GetxController{
  final RegisterModel model = RegisterModel();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController middlenameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController extensionnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Register method
  void register() {
    if (!model.isValidEmail(emailController.text)) {
      Get.dialog(
        AlertDialog(
          title: Text("Invalid Email"),
          content: Text("Please enter a valid email address."),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
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
          content: Text("Registration successful!"),
          actions: [
            TextButton(
              onPressed: (() => Get.back()),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }
}