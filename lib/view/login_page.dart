import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../components/account_button.dart';
import '../components/my_textfield.dart';
import '../controllers/login_controller.dart';
import 'package:layout_design/controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final AuthController authController = Get.put(AuthController());
  final Function()? onTap;

  LoginPage({
    super.key,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
  final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(44.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 210,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage('lib/assets/images/Removal-432.png'),
                    fit: BoxFit.cover,
                    width: 55,
                    height: 74,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                            height: 1
                          ),
                        ),
                        Text('Enter your credentials to continue', style: TextStyle(
                          fontSize: 13,
                          color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 86,),

              // Email text field
              MyTextfield(
                identifier: "email",
                hintText: "Email",
                obscureText: false,
                controller: authController.emailController,
                prefixIcon: Icons.person,
              ),

              SizedBox(height: 12,),

              // Password text field
              MyTextfield(
                identifier: "password",
                hintText: "Password",
                obscureText: true,
                controller: authController.passwordController,
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility_off,
              ),

              SizedBox(height: 28,),

              // Forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    onTap: () => Get.toNamed('/recoverpasswordemail'),
                  ),
                ],
              ),

              SizedBox(height: 28,),

              // Login button
              AccountButton(
                text: "Login",
                color: Colors.blueGrey,
                onTap: () {
                    if(authController.emailController.text.isEmpty
                    || authController.passwordController.text.isEmpty){
                      Get.snackbar('Blank username or password', 'Type in username and password');
                    }
                    else{
                      authController.loginProfile();
                      // authController.emailController.clear();
                      // authController.passwordController.clear();
                    }
                },
              ),

              SizedBox(height: 10,),

              // Register link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () => Get.toNamed('/registerpage'),
                    child: const Text(
                      "Register here",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12,),

              // Test text (optional)
              const Padding(
                padding: EdgeInsets.only(right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "©2023 Zamboanga City Medical Center. All rights reserved",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:loginattempt/components/my_button.dart';
// import 'package:loginattempt/components/my_textfield.dart';

// class LoginPage extends StatelessWidget {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   final void Function()? onTap;

//   // String emailRegex = r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0 -9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}";

//   bool isValidEmail(String email) {
//     String emailRegex = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,7}$";
//     RegExp regExp = RegExp(emailRegex); 
//     return regExp.hasMatch(email);
//   }

//   LoginPage({
//     super.key,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {

//   //login method
//   void login() {
//     if (!isValidEmail(emailController.text)) {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text("Invalid Email"),
//           content: Text("Please enter a valid email address as you type."),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text("OK"),
//             ),
//           ],
//         ),
//       );
//       print("false");
//     } else {
//       // Proceed with login
//       if (onTap != null) {
//         onTap!();
//       }
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text("Valid Email"),
//           content: Text("It works"),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text("OK"),
//             ),
//           ],
//         ),
//       );
//     }
//   }

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               SizedBox(height: 120,),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 //logo
//                 children: [
//                   Image(
//                     image: AssetImage('lib/assets/images/Removal-432.png'),
//                     fit: BoxFit.cover,
//                     width: 59.73,
//                     height: 80,
//                   ),
//                 //company
//                   Padding(
//                     padding: EdgeInsets.only(left: 16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Sign In',
//                               style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.teal
//                               ),
//                             textAlign: TextAlign.left,
//                             ),
//                         Text('Enter your credentials to continue', style: TextStyle(fontSize: 12),)
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
          
//                 SizedBox(height: 64,),
          
//                 //email
//                 MyTextfield(
//                   identifier: "email",
//                   hintText: "Email",
//                   obscureText: false,
//                   controller: emailController,
//                   prefixIcon: Icons.person,
//                 ),
          
//                 SizedBox(height: 24,),
                
//                 //password
//                 MyTextfield(
//                   identifier: "password",
//                   hintText: "Password",
//                   obscureText: true,
//                   controller: passwordController,
//                   prefixIcon: Icons.lock,
//                   suffixIcon: Icons.visibility_off,
//                 ),
          
//                 SizedBox(height: 24,),
          
//                 //forgot password
//                 const Padding(
//                   padding: EdgeInsets.only(right:18),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text("Forgot Password?")
//                     ],
//                   ),
//                 ),
          
//                 SizedBox(height: 24,),
          
//                 //sign in
//                 SubmitButton(
//                   text: "Login",
//                   color: Colors.teal,
//                   onTap: () => login(),
//                 ),
          
//                 SizedBox(height: 20,),
          
//                 //sign in
//                 SubmitButton(
//                   text: "Home",
//                   onTap: (){},
//                   color: Colors.grey
//                 ),
          
//                 SizedBox(height: 10,),
          
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Don't have an account? "),
//                     GestureDetector(
//                       onTap: onTap,
//                       child: const Text(
//                         "Register here",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
          
//                 SizedBox(height: 24,),
          
//                 //forgot password
//                 const Padding(
//                   padding: EdgeInsets.only(right:18),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "test",
//                         style: TextStyle(fontSize: 8),
//                       )
//                     ],
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }