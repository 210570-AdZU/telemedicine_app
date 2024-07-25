// lib/controllers/user_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:layout_design/models/user.dart';
import 'package:layout_design/helpers/user_database.dart';

class UserController extends GetxController {
  var fNameController = TextEditingController();
  var mNameController = TextEditingController();
  var lNameController = TextEditingController();
  var extensionNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

Future<void> registerUser() async {
  try {
    final user = User(
      fName: fNameController.text,
      mName: mNameController.text,
      lName: lNameController.text,
      extensionName: extensionNameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    final result = await UserDatabase().insertUser(user.toMap()); 
    if (result > 0) { // Check for a positive result
      fNameController.clear();
      mNameController.clear();
      lNameController.clear();
      extensionNameController.clear();
      emailController.clear();
      passwordController.clear();
      Get.snackbar('Success', 'User registered successfully');
      Get.toNamed('/loginpage');
    } else {
      final users  = await UserDatabase().getUsers();
      print(users.first.isEmpty);
      Get.snackbar('Error', 'Failed to register user');
    }
  } catch (e) {
    Get.snackbar('Error', 'Failed to register user: $e');
  }
}

}