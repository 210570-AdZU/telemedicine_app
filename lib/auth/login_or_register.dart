import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/login_page.dart';
import '../view/register_page.dart';
import '../controllers/login_or_register_controller.dart';

class LoginOrRegister extends StatelessWidget {
  final LoginOrRegisterController controller = Get.put(LoginOrRegisterController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.showLoginPage.value
        ? LoginPage(
            onTap: controller.togglePages,
          )
        : RegisterPage(
            onTap: controller.togglePages,
          ));
  }
}

// END

// import 'package:flutter/material.dart';
// import 'package:loginattempt/pages/login_page.dart';
// import 'package:loginattempt/pages/register_page.dart';


// class LoginOrRegister extends StatefulWidget {
//   const LoginOrRegister({super.key});

//   @override
//   State<LoginOrRegister> createState() => _LoginOrRegisterState();
// }

// class _LoginOrRegisterState extends State<LoginOrRegister> {

//   bool showLoginPage = true;

//   void togglePages(){
//     setState(() => showLoginPage = !showLoginPage);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return showLoginPage ? LoginPage(onTap: togglePages) : RegisterPage(onTap: togglePages);
//   }
// }

//     setState(() {
//       showLoginPage = !showLoginPage;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if(showLoginPage){
//       return LoginPage(onTap: togglePages);
//     }
//     else {
//       return RegisterPage(onTap: togglePages);
//     }
//   }
// }