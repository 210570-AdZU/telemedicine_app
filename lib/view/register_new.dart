import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:layout_design/components/account_button.dart';
import 'package:layout_design/components/register_dropdownselect.dart';
import 'package:layout_design/controllers/profile_list_controller.dart';
import '../components/my_textfield.dart';
import '../controllers/profile_controller.dart';

class RegisterNew extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());
  final ProfileListController profileListController = Get.put(ProfileListController());
  final void Function()? onTap;

  // String emailRegex = r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0 -9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}";
  RegisterNew({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
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
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add New Account', style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal
                          ),
                        textAlign: TextAlign.left,
                        ),
                      Text('Enter credentials to continue', style: TextStyle(fontSize: 11),)
                    ],
                  ),
                ),
                ],
              ),
          
                SizedBox(height: 40,),

                MyTextfield(
                  identifier: "first name",
                  hintText: "Enter first name",
                  obscureText: false,
                  controller: profileController.fNameController,
                  prefixIcon: Icons.person,
                ),
          
                SizedBox(height: 24,),

                MyTextfield(
                  identifier: "middle name",
                  hintText: "Enter middle name",
                  obscureText: false,
                  controller: profileController.mNameController,
                  prefixIcon: Icons.person,
                ),
          
                SizedBox(height: 24,),

                MyTextfield(
                  identifier: "last name",
                  hintText: "Enter last name",
                  obscureText: false,
                  controller: profileController.lNameController,
                  prefixIcon: Icons.person,
                ),
          
                SizedBox(height: 24,),

                MyTextfield(
                  identifier: "extension name",
                  hintText: "Enter extension name",
                  obscureText: false,
                  controller: profileController.extensionNameController,
                  prefixIcon: Icons.person,
                ),

                SizedBox(height: 24,),

                RegisterDropdownselect(
                  onChanged: (String? newValue) {
                      if (newValue != null) {
                        profileController.selectedHospital.value = newValue;
                      }
                    },
                  items: <String>[
                      'Brent Hospital and Colleges Inc.',
                      'West Metro Medical Center',
                      'Zamboanga City Medical Center (ZCMC)',
                      'Zamboanga Peninsula Medical Center (ZamPen)',
                    ]
                ),

                SizedBox(height: 24,),

                RegisterDropdownselect(
                  onChanged: (String? newValue) {
                      if (newValue != null) {
                        profileController.selectedSpecialization.value = newValue;
                      }
                    },
                  items: <String>[
                    'Anesthiology (ANES)',
                    'Dermatology (DERM)', 
                    'Obstetrics and Gynecology (OB/GYN)',
                    'Pediatrics (PEDS)', 
                    'Psychiatry (PSY)',
                    ]
                ),
          
                SizedBox(height: 24,),

                MyTextfield(
                  identifier: "email",
                  hintText: "Email",
                  obscureText: false,
                  controller: profileController.emailController,
                  prefixIcon: Icons.mail,
                ),
          
                SizedBox(height: 24,),

                MyTextfield(
                  identifier: "password",
                  hintText: "Password",
                  obscureText: true,
                  controller: profileController.passwordController,
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility_off,
                ),
          
                SizedBox(height: 24,),
                
                //password
                MyTextfield(
                  identifier: "password confirmation",
                  hintText: "Confirm Password",
                  obscureText: true,
                  controller: TextEditingController(),
                  ConfirmPwd: true,
                  passwordController: profileController.passwordController,
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility_off,
                ),
          
                SizedBox(height: 24,),
          
                //sign up
                AccountButton(
                  text: "Submit",
                  color: Colors.blueGrey,
                  onTap: () {
                    profileController.registerProfile();
                    profileListController.loadProfiles();
                  },
                ),
          
                SizedBox(height: 20,),

                AccountButton(
                  text: "Back",
                  onTap: ()=> Get.back(),
                  color: const Color.fromARGB(255, 222, 222, 222),
                  initialTextColor: Colors.blueGrey,
                ),
          
                SizedBox(height: 24,),
          
                const Padding(
                  padding: EdgeInsets.only(right:18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "© Zamboanga City Medical Center 2023 , All Rights Reserved",
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