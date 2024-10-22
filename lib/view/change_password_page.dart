import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/components/account_button.dart';
import 'package:layout_design/components/my_textfield.dart';
import '../controllers/auth_controller.dart';

class ChangePasswordPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (authController.currentProfile.value != null) {
      authController.initializeTextControllers(authController.currentProfile.value!);
    }
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            children: [
              Image.asset(
                  'lib/assets/images/Removal-432.png',
                  fit: BoxFit.fill,
                  width: 43,
                  height: 58,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.075,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Telemedicine Web App',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 1,
                    width: 208,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black26,
                      ),
                    ),
                  ),
                  Text(
                    ' Zamboanga City Medical Center',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: 12,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Change Password",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54
                      ),
                    ),
                    Spacer(),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit_outlined, color: Colors.black45,)),
                  ],
                ),
                SizedBox(height: 8,),
                Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
                SizedBox(height: 8,),
                MyTextfield(
                isCollapsed: true,
                identifier: 'password',
                hintText: '    password',
                obscureText: true,
                controller: authController.passwordController,
              ),
              SizedBox(height: 20,),
                AccountButton(
                  text: 'Update Info',
                  onTap: () {
                    authController.updateProfile();
                  },
                  color: Colors.blueGrey),
              ],
            ),
            SizedBox(height: 12,),
          ],
        ),
      ),
    );
  }
}