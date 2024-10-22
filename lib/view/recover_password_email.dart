import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/controllers/recovery_controller.dart';
import '../components/account_button.dart';
import '../components/my_textfield.dart';

class RecoverPasswordEmail extends StatelessWidget {
  final RecoveryController recoveryController = Get.put(RecoveryController());
  final Function()? onTap;

  RecoverPasswordEmail({
    super.key,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
  final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(39.0),
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
                    width: 56,
                    height: 75,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recover Password',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Text(
                          'Enter your credentials to continue',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 93,),

              // Forgot password
              Text(
                  "A recovery link will be sent to the email bound to your account. "
                  "Upon submitting, open your Gmail app on your phone or sign in to "
                  "your Gmail account in Google Chrome and check your inbox for the "
                  "recovery link. Click the link and it will redirect to a page to "
                  "change your account password.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade700
                  ),
                  textAlign: TextAlign.start,
              ),

              SizedBox(height: 32,),

              // Email text field
              MyTextfield(
                identifier: "email",
                hintText: "Email",
                obscureText: false,
                controller: recoveryController.emailController,
                prefixIcon: Icons.email,
              ),

              SizedBox(height: 44,),
              // Login button
              AccountButton(
                text: "Send Code",
                color: Colors.blueGrey,
                onTap: () {
                  recoveryController.sendCode();
                },
              ),

              SizedBox(height: 20,),

              // Register link
              AccountButton(
                text: 'Back',
                onTap: ()=>{
                  recoveryController.emailController.clear(),
                  Get.back(),
                },
                color: const Color.fromARGB(255, 222, 222, 222),
                initialTextColor: Colors.blueGrey,
              ),

              SizedBox(height: 93,),

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