// lib/controllers/recovery_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:layout_design/helpers/profile_database.dart';
import 'dart:math';

class RecoveryController extends GetxController {
  var emailController = TextEditingController();
  var codeController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var generatedCode = ''.obs;

  // List of TextEditingController and FocusNode for code fields
  List<TextEditingController> codeFields = List.generate(6, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  Future<void> sendCode() async {
    String email = emailController.text;
    final db = await ProfileDatabase().database;
    List<Map<String, dynamic>> users = await db.query(
      'profiles',
      where: 'email = ?',
      whereArgs: [email],
    );

    if (users.isEmpty) {
      Get.snackbar('Error', 'User not found');
    } else {
      generatedCode.value = (Random().nextInt(900000) + 100000).toString();
      print('Recovery Code: ${generatedCode.value}');
      Get.toNamed('/recoverpasswordconfirm');
    }
  }

  bool validateCode() {
    String enteredCode = codeFields.map((controller) => controller.text).join();
    print('Entered Code: $enteredCode');
    return enteredCode == generatedCode.value;
  }

  Future<void> setPassword() async {
    if (newPasswordController.text == confirmPasswordController.text) {
      String email = emailController.text;
      final db = await ProfileDatabase().database;
      await db.update(
        'profiles',
        {'password': newPasswordController.text},
        where: 'email = ?',
        whereArgs: [email],
      );
      emailController.clear();
      codeController.clear();
      newPasswordController.clear();
      confirmPasswordController.clear();
      Get.snackbar('Success', 'Password updated successfully');
      Get.toNamed('/loginpage');
    } else {
      Get.snackbar('Error', 'Passwords do not match');
    }
  }
}