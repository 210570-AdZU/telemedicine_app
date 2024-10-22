import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/controllers/recovery_controller.dart';
import '../components/account_button.dart';
import '../components/my_textfield.dart';
import '../controllers/login_controller.dart';
import 'package:layout_design/controllers/auth_controller.dart';

class RecoverPasswordSet extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final AuthController authController = Get.put(AuthController());
  final RecoveryController recoveryController = Get.put(RecoveryController());
  final Function()? onTap;

  RecoverPasswordSet({
    super.key,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
  final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 120,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage('lib/assets/images/Removal-432.png'),
                    fit: BoxFit.cover,
                    width: 47,
                    height: 63,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recover Password',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        Text('Enter your credentials to continue', style: TextStyle(fontSize: 11),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 72,),

              // Forgot password
              const Padding(
                padding: EdgeInsets.only(right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Set the new password and don't forget it",
                      style: TextStyle(
                        fontSize: 14
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24,),

              // Email text field
              MyTextfield(
                identifier: "new password",
                hintText: "New Password",
                obscureText: true,
                controller: recoveryController.newPasswordController,
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility_off,
              ),

              SizedBox(height: 24,),

              // Password text field
              MyTextfield(
                identifier: "password confirmation",
                hintText: "Confirm Password",
                obscureText: true,
                controller: recoveryController.confirmPasswordController,
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility_off,
              ),

              SizedBox(height: 24,),

              // Login button
              AccountButton(
                text: "Send Code",
                color: Colors.blueGrey,
                onTap: () {
                  recoveryController.setPassword();
                },
              ),

              SizedBox(height: 24,),

              // Register link
              AccountButton(
                text: 'Back',
                onTap: ()=>{
                  recoveryController.codeController.clear(),
                  recoveryController.newPasswordController.clear(),
                  recoveryController.confirmPasswordController.clear(),
                  Get.back(),
                },
                color: Colors.black26,
                initialTextColor: Colors.black54,
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
                      style: TextStyle(fontSize: 8),
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