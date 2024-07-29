// lib/controllers/auth_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:layout_design/models/profile.dart';
import 'package:layout_design/helpers/profile_database.dart';
import 'package:layout_design/controllers/profile_list_controller.dart';

class AuthController extends GetxController {
  final ProfileListController profileListController = Get.put(ProfileListController());
  var fNameController = TextEditingController();
  var mNameController = TextEditingController();
  var lNameController = TextEditingController();
  var extensionNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Rx<Profile?> currentProfile = Rx<Profile?>(null);
  
  @override
  void onInit() {
    super.onInit();
    ever(currentProfile, (profile) {
      if (profile != null) {
        initializeTextControllers(profile);
      }
    });
  }

  void initializeTextControllers(Profile profile) {
    fNameController.text = profile.fName;
    mNameController.text = profile.mName;
    lNameController.text = profile.lName;
    extensionNameController.text = profile.extensionName;
    emailController.text = profile.email;
    passwordController.text = profile.password;
  }

  Future<void> loginProfile() async {
    String email = emailController.text;
    String password = passwordController.text;

    final db = await ProfileDatabase().database;
    List<Map<String, dynamic>> profiles = await db.query(
      'profiles',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (profiles.isNotEmpty) {
      currentProfile.value = Profile.fromMap(profiles.first);
      Get.snackbar('Success', 'Logged in successfully');
      profileListController.loadProfiles();
      profileListController.loadHospitals();
      profileListController.loadSpecializations();
      Get.toNamed('/firstpage');
    } else {
      Get.snackbar('Error', 'Invalid username or password');
    }
  }

  void logout() {
    currentProfile.value = null;
    fNameController.clear();
    mNameController.clear();
    lNameController.clear();
    extensionNameController.clear();
    emailController.clear();
    passwordController.clear();
    Get.toNamed('/loginpage');
  }

  Future<void> updateProfile() async {
    if (currentProfile.value != null) {
      final profile = Profile(
        id: currentProfile.value!.id,
        fName: fNameController.text,
        mName: mNameController.text,
        lName: lNameController.text,
        extensionName: extensionNameController.text,
        email: emailController.text,
        password: passwordController.text,
        hospitalId: currentProfile.value!.hospitalId,
        specializationId: currentProfile.value!.specializationId,
      );

      final db = await ProfileDatabase().database;
      await db.update(
        'profiles',
        profile.toMap(),
        where: 'id = ?',
        whereArgs: [profile.id],
      );

      currentProfile.value = profile;
      Get.snackbar('Success', 'Profile info updated successfully');
    }
  }

  Future<void> deleteProfile() async {
    if (currentProfile.value != null) {
      final db = await ProfileDatabase().database;
      await db.delete(
        'profiles',
        where: 'id = ?',
        whereArgs: [currentProfile.value!.id],
      );

      logout();
      Get.snackbar('Success', 'Profile deleted successfully');
    }
  }
}