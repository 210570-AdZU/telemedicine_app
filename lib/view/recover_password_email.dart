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
    return Scaffold(
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
                padding: EdgeInsets.only(right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "A recovery link will be sent to the email binded to your\naccount."
                      " Upon submitting, open your Gmail app on your\nphone or sign in to"
                      " your Gmail account in Google Chrome\nand check your inbox for the"
                      "recovery link. Click the link\n and it will redirect to a page to"
                      "change your account\npassword.",
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
                identifier: "email",
                hintText: "Email",
                obscureText: false,
                controller: recoveryController.emailController,
                prefixIcon: Icons.email,
              ),

              SizedBox(height: 24,),
              // Login button
              AccountButton(
                text: "Send Code",
                color: Colors.blueGrey,
                onTap: () {
                  recoveryController.sendCode();
                },
              ),

              SizedBox(height: 24,),

              // Register link
              AccountButton(
                text: 'Back',
                onTap: ()=>{
                  recoveryController.emailController.clear(),
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