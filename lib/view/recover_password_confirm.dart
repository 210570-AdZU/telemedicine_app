import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/controllers/recovery_controller.dart';
import '../components/account_button.dart';

class RecoverPasswordConfirm extends StatelessWidget {
  final RecoveryController recoveryController = Get.put(RecoveryController());
  final Function()? onTap;

  RecoverPasswordConfirm({
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "A code has been sent to your email. Enter the code\nto validate.",
                    style: TextStyle(
                      fontSize: 14
                    ),
                  ),
                ],
              ),

              SizedBox(height: 32,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) => _buildCodeField(index)),
              ),

              SizedBox(height: 40,),

              // Login button
              AccountButton(
                text: "Send Code",
                color: Colors.blueGrey,
                onTap: () {
                  recoveryController.codeController.text = recoveryController.codeFields.map((controller) => controller.text).join();
                  if (recoveryController.validateCode()) {
                    Get.toNamed('/recoverpasswordset');
                  } else {
                    Get.snackbar('Error', 'Invalid code');
                  }
                },
              ),

              SizedBox(height: 24,),

              // Register link
              AccountButton(
                text: 'Back',
                onTap: ()=>{
                  recoveryController.codeController.clear(),
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
  Widget _buildCodeField(int index) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextField(
        controller: recoveryController.codeFields[index],
        focusNode: recoveryController.focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 4),
          counterText: "",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
        )
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            FocusScope.of(Get.context!).requestFocus(recoveryController.focusNodes[index + 1]);
          }
          if (value.isEmpty && index > 0) {
            FocusScope.of(Get.context!).requestFocus(recoveryController.focusNodes[index - 1]);
          }
        },
      ),
    );
  }
}