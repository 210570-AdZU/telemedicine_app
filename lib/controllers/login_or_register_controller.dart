import 'package:get/get.dart';

class LoginOrRegisterController extends GetxController {
  var showLoginPage = true.obs;

  void togglePages() {
    showLoginPage.toggle();
  }
}