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
  final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
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
                    width: 56,
                    height: 75,
                  ),

                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          height: 1
                        ),
                        textAlign: TextAlign.left,
                        ),
                      Text('Enter your credentials to continue',
                      style: TextStyle(
                        fontSize: 13
                        ),
                      )
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

                Obx(() {
                  return DropdownButtonFormField<int>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.black12
                          ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.black12
                          ),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.black12
                          ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                    ),
                    value: profileController.hospitalId.value,
                    hint: Text('Select Hospital'),
                    items: profileListController.hospitals.map((hospital) {
                      return DropdownMenuItem<int>(
                        value: hospital.id,
                        child: Text(
                          hospital.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        profileController.hospitalId.value = value;
                      }
                    },
                  );
                }),

                SizedBox(height: 24,),

                Obx(() {
                  return DropdownButtonFormField<int>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.black12
                          ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.black12
                          ),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.black12
                          ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                    ),
                    value: profileController.specializationId.value,
                    hint: Text('Select Specialization'),
                    items: profileListController.specializations.map((specialization) {
                      return DropdownMenuItem<int>(
                        value: specialization.id,
                        child: Text(
                          specialization.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        profileController.specializationId.value = value;
                      }
                    },
                  );
                }),
          
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