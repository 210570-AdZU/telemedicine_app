import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/view/change_password_page.dart';
import 'package:layout_design/view/profile_page.dart';

import '../view/about_us.dart';
import '../view/device_logs.dart';
import '../view/terms_and_conditions.dart';

class MenuPageController extends GetxController {
  var selectedIndex = 0.obs;
  RxInt pageNum = 0.obs;

  final List<Widget> pages = [
    ProfilePage(),
    ChangePasswordPage(),
    DeviceLogs(),
    TermsAndConditions(),
    AboutUs(),
  ];

  @override
  void onInit(){
    super.onInit();
    pageNum.value = pages.length;
  }

  void navigateToPage(int index) {
    selectedIndex.value = index;
  }
}
