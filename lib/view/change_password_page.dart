import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/components/my_textfield.dart';
import '../controllers/auth_controller.dart';

class ChangePasswordPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (authController.currentUser.value != null) {
      authController.initializeTextControllers(authController.currentUser.value!);
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(width: 40, child: Image.asset('lib/assets/images/Removal-432.png')),
              SizedBox(width: MediaQuery.of(context).size.width * 0.075,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                children: [
                  Text(
                    'Telemedicine Web App',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    ' Zamboanga City Medical Center',
                    style: TextStyle(
                      fontSize: 12,
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
                obscureText: false,
                controller: authController.passwordController,
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  authController.updateUser();
                },
                child: Text('Update Info'),
              ),
              ],
            ),
            SizedBox(height: 12,),
          ],
        ),
      ),
    );
  }
}