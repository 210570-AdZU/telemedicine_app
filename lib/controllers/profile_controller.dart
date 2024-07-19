import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/models/profile_model.dart';

class ProfileController extends GetxController{
  final ProfileModel model = ProfileModel();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController middlenameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController extensionnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
}