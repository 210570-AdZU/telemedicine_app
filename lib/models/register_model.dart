import 'package:get/get.dart';
class RegisterModel extends GetxController{
  // Validate email
  bool isValidEmail(String email) {
    String emailRegex =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,7}$";
    RegExp regExp = RegExp(emailRegex);
    return regExp.hasMatch(email);
  }
  
  bool isValidPwd(String password) {
    String passwordRegex = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[.!#$%&\'*+/=?^_`{|}~-]).{8,}$";
    RegExp regExp2 = RegExp(passwordRegex);
    return regExp2.hasMatch(password);
  }

}