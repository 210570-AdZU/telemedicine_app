import 'package:get/get.dart';
class LoginModel extends GetxController{
  // Validate email
  bool isValidEmail(String email) {
    String emailRegex =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,7}$";
    RegExp regExp = RegExp(emailRegex);
    return regExp.hasMatch(email);
  }
}