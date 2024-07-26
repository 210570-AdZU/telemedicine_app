// lib/controllers/user_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:layout_design/models/profile.dart';
import 'package:layout_design/helpers/profile_database.dart';

class ProfileController extends GetxController {
  var fNameController = TextEditingController();
  var mNameController = TextEditingController();
  var lNameController = TextEditingController();
  var extensionNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var selectedHospital = 'Select Hospital'.obs;
  var selectedSpecialization = 'Select Specialization'.obs;

Future<void> registerProfile() async {
  try {
    final profile = Profile(
      fName: fNameController.text,
      mName: mNameController.text,
      lName: lNameController.text,
      extensionName: extensionNameController.text,
      email: emailController.text,
      password: passwordController.text,
      hospital: selectedHospital.value,
      specialization: selectedSpecialization.value,
    );

    final result = await ProfileDatabase().insertProfile(profile.toMap()); 
    if (result > 0) { // Check for a positive result
      fNameController.clear();
      mNameController.clear();
      lNameController.clear();
      extensionNameController.clear();
      emailController.clear();
      passwordController.clear();
      Get.snackbar('Success', 'Profile registered successfully');
    } else {
      final profiles  = await ProfileDatabase().getProfiles();
      print(profiles.first.isEmpty);
      Get.snackbar('Error', 'Failed to register profile');
    }
  } catch (e) {
    Get.snackbar('Error', 'Failed to register profile: $e');
  }
}

}