import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/assets/themes.dart';
import 'package:layout_design/auth/login_or_register.dart';
import 'package:layout_design/view/archives.dart';
import 'package:layout_design/view/case_view.dart';
import 'package:layout_design/view/chat_room.dart';
import 'package:layout_design/view/doctor_page.dart';
import 'package:layout_design/view/first_page.dart';
import 'package:layout_design/view/login_page.dart';
import 'package:layout_design/view/menu_page.dart';
import 'package:layout_design/view/patient_page.dart';
import 'package:layout_design/view/recover_password_email.dart';
import 'package:layout_design/view/recover_password_confirm.dart';
import 'package:layout_design/view/recover_password_set.dart';
import 'package:layout_design/view/register_case_page.dart';
import 'package:layout_design/view/register_new.dart';
import 'package:layout_design/view/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = [
    GetPage(name: '/', page: () => LoginOrRegister()),
    GetPage(name: '/loginpage', page: () => LoginPage()),
    GetPage(name: '/registerpage', page: () => RegisterPage()),
    GetPage(name: '/firstpage', page: () => FirstPage()),
    GetPage(name: '/doctorpage', page: () => DoctorPage()),
    GetPage(name: '/patientpage', page: () => PatientPage()),
    GetPage(name: '/archives', page: () => Archives()),
    GetPage(name: '/caseview', page: () => CaseView()),
    GetPage(name: '/menupage', page: () => MenuPage()),
    GetPage(name: '/registercasepage', page: () => RegisterCasePage()),
    GetPage(name: '/chatroom', page: () => ChatRoom()),
    GetPage(name: '/registernew', page: () => RegisterNew()),
    GetPage(name: '/recoverpasswordemail', page: () => RecoverPasswordEmail()),
    GetPage(name: '/recoverpasswordconfirm', page: () => RecoverPasswordConfirm()),
    GetPage(name: '/recoverpasswordset', page: () => RecoverPasswordSet()),
  ];
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetMaterialApp(
      color: theme.scaffoldBackgroundColor,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: routes,
      theme: appTheme,
    );
  }
}