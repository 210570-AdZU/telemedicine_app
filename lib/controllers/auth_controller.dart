// lib/controllers/auth_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:layout_design/models/user.dart';
import 'package:layout_design/helpers/user_database.dart';

class AuthController extends GetxController {
  var fNameController = TextEditingController();
  var mNameController = TextEditingController();
  var lNameController = TextEditingController();
  var extensionNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Rx<User?> currentUser = Rx<User?>(null);
  
  @override
  void onInit() {
    super.onInit();
    ever(currentUser, (user) {
      if (user != null) {
        initializeTextControllers(user);
      }
    });
  }

  void initializeTextControllers(User user) {
    fNameController.text = user.fName;
    mNameController.text = user.mName;
    lNameController.text = user.lName;
    extensionNameController.text = user.extensionName;
    emailController.text = user.email;
    passwordController.text = user.password;
  }

  Future<void> loginUser() async {
    String email = emailController.text;
    String password = passwordController.text;

    final db = await UserDatabase().database;
    List<Map<String, dynamic>> users = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (users.isNotEmpty) {
      currentUser.value = User.fromMap(users.first);
      Get.snackbar('Success', 'Logged in successfully');
      Get.toNamed('/firstpage');
    } else {
      Get.snackbar('Error', 'Invalid username or password');
    }
  }

  void logout() {
    currentUser.value = null;
    fNameController.clear();
    mNameController.clear();
    lNameController.clear();
    extensionNameController.clear();
    emailController.clear();
    passwordController.clear();
    Get.toNamed('/loginpage');
  }

  Future<void> updateUser() async {
    if (currentUser.value != null) {
      final user = User(
        id: currentUser.value!.id,
        fName: fNameController.text,
        mName: mNameController.text,
        lName: lNameController.text,
        extensionName: extensionNameController.text,
        email: emailController.text,
        password: passwordController.text,
      );

      final db = await UserDatabase().database;
      await db.update(
        'users',
        user.toMap(),
        where: 'id = ?',
        whereArgs: [user.id],
      );

      currentUser.value = user;
      Get.snackbar('Success', 'User info updated successfully');
    }
  }

  Future<void> deleteUser() async {
    if (currentUser.value != null) {
      final db = await UserDatabase().database;
      await db.delete(
        'users',
        where: 'id = ?',
        whereArgs: [currentUser.value!.id],
      );

      logout();
      Get.snackbar('Success', 'User deleted successfully');
    }
  }
}