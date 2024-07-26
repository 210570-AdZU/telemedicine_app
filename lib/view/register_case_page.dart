import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../components/register_dropdownselect.dart';
import '../components/account_button.dart';
import '../components/my_textfield.dart';
import '../controllers/register_case_controller.dart';

class RegisterCasePage extends StatelessWidget {
  final RegisterCaseController controller = Get.put(RegisterCaseController());
  final Function()? onTap;
  // String emailRegex = r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0 -9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}";
  RegisterCasePage({
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                //logo
                children: [
                //company
                Text(
                  'Register Case', style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey
                    ),
                  textAlign: TextAlign.left,
                  ),
                ],
              ),
          
                SizedBox(height: 15,),

                Text(
                  "Patient",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),

                SizedBox(height: 8,),

                DropdownButtonFormField<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                  ),
                  onChanged: (String? newValue) {
                    // if (newValue != null) {
                    // }
                  },
                  items: <String>[
                    '(None)',
                    'Test'
                  ]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),

                SizedBox(height: 6,),

                Text(
                  "Specialization",
                  style: TextStyle(
                    fontSize: 12
                  ),
                ),

                SizedBox(height: 6,),

                DropdownButtonFormField<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                  ),
                  onChanged: (String? newValue) {
                    // if (newValue != null) {
                    // }
                  },
                  items: <String>[
                    '(None)',
                    'Test'
                  ]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),

                SizedBox(height: 20,),

                Text(
                  "Temperature",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),

                SizedBox(height: 8,),

                MyTextfield(
                  identifier: "temperature",
                  hintText: "Temperature",
                  isCollapsed: true,
                  obscureText: false,
                  controller: controller.temperatureController,
                ),

                SizedBox(height: 16,),

                Text(
                  "Respiration",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),

                SizedBox(height: 8,),

                MyTextfield(
                  identifier: "respiration",
                  hintText: "Respiration",
                  isCollapsed: true,
                  obscureText: false,
                  controller: controller.respirationController,
                ),

                SizedBox(height: 16,),

                Text(
                  "Heart",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),

                SizedBox(height: 8,),
                
                MyTextfield(
                  identifier: "heart status",
                  hintText: "Heart",
                  isCollapsed: true,
                  obscureText: false,
                  controller: controller.heartController,
                ),

                SizedBox(height: 16,),

                Text(
                  "Blood",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),

                SizedBox(height: 8,),
                
                MyTextfield(
                  identifier: "blood status",
                  hintText: "Blood",
                  isCollapsed: true,
                  obscureText: false,
                  controller: controller.bloodController,
                ),

                SizedBox(height: 16,),

                Text(
                  "Oxygen",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),

                SizedBox(height: 8,),
                
                MyTextfield(
                  identifier: "oxygen status",
                  hintText: "Oxygen",
                  isCollapsed: true,
                  obscureText: false,
                  controller: controller.oxygenController,
                ),

                SizedBox(height: 20,),

                Text(
                  "Weight",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),

                SizedBox(height: 8,),
                
                MyTextfield(
                  identifier: "weight",
                  hintText: "Weight",
                  isCollapsed: true,
                  obscureText: false,
                  controller: controller.weightController,
                ),

                SizedBox(height: 16,),

                Text(
                  "Height",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),

                SizedBox(height: 8,),
                
                MyTextfield(
                  identifier: "height",
                  hintText: "Height",
                  isCollapsed: true,
                  obscureText: false,
                  controller: controller.heightController,
                ),
          
                SizedBox(height: 16,),

                Text(
                  "Chief complaint",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),

                SizedBox(height: 8,),
                
                MyTextfield(
                  identifier: "chief complaint",
                  hintText: "Chief complaint",
                  fontSize: 14,
                  contentPadding: EdgeInsets.fromLTRB(12, 4, 8, 44),
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  isCollapsed: true,
                  obscureText: false,
                  controller: controller.complaintController,
                ),
          
                SizedBox(height: 16,),

                Text(
                  "History of present illness",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),

                SizedBox(height: 8,),
                
                MyTextfield(
                  identifier: "history of present illness",
                  hintText: "History of present illness",
                  fontSize: 14,
                  contentPadding: EdgeInsets.fromLTRB(12, 4, 8, 44),
                  isCollapsed: true,
                  obscureText: false,
                  controller: controller.illnessController,
                ),
          
                SizedBox(height: 16,),

                Text(
                  "Past medical history",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),

                SizedBox(height: 8,),
                
                MyTextfield(
                  identifier: "past medical history",
                  hintText: "Past medical history",
                  fontSize: 14,
                  contentPadding: EdgeInsets.fromLTRB(12, 4, 8, 44),
                  isCollapsed: true,
                  obscureText: false,
                  controller: controller.pastHistController,
                ),
          
                SizedBox(height: 16,),

                Text(
                  "Review of system",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),

                SizedBox(height: 8,),
                
                MyTextfield(
                  identifier: "review of system",
                  hintText: "Review of system",
                  fontSize: 14,
                  contentPadding: EdgeInsets.fromLTRB(12, 4, 8, 44),
                  isCollapsed: true,
                  obscureText: false,
                  controller: controller.reviewController,
                ),
          
                SizedBox(height: 16,),

                Text(
                  "Physical examination",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),

                SizedBox(height: 8,),
                
                MyTextfield(
                  identifier: "physical examination",
                  hintText: "Physical examination",
                  fontSize: 14,
                  contentPadding: EdgeInsets.fromLTRB(12, 4, 8, 44),
                  isCollapsed: true,
                  obscureText: false,
                  controller: controller.examinationController,
                ),
          
                SizedBox(height: 16,),

                Text(
                  "Ward information",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),

                SizedBox(height: 8,),
                
                MyTextfield(
                  identifier: "ward information",
                  hintText: "Ward information",
                  fontSize: 14,
                  contentPadding: EdgeInsets.fromLTRB(12, 4, 8, 44),
                  isCollapsed: true,
                  obscureText: false,
                  controller: controller.wardInfoController,
                ),
          
                SizedBox(height: 16,),

                Text(
                  "Inherited medical disorders",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),

                SizedBox(height: 8,),
                
                MyTextfield(
                  identifier: "inherited medical disorders",
                  hintText: "Inherited medical disorders",
                  fontSize: 14,
                  contentPadding: EdgeInsets.fromLTRB(12, 4, 8, 44),
                  isCollapsed: true,
                  obscureText: false,
                  controller: controller.inheritedDisorderController,
                ),
          
                SizedBox(height: 16,),

                Text(
                  "Reason",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),

                SizedBox(height: 8,),
                
                MyTextfield(
                  identifier: "reason",
                  hintText: "Reason",
                  fontSize: 14,
                  contentPadding: EdgeInsets.fromLTRB(12, 4, 8, 44),
                  isCollapsed: true,
                  obscureText: false,
                  controller: controller.reasonController,
                ),
          
                SizedBox(height: 16,),
          
                //sign in
                Row(
                  children: [
                    Spacer(),
                    
                    AccountButton(
                      text: "Back",
                      onTap: ()=> {Get.back()},
                      color: const Color.fromARGB(255, 222, 222, 222),
                      initialTextColor: Colors.blueGrey,
                    ),
              
                    SizedBox(width: 20,),
              
                    //sign in
                    AccountButton(
                      text: "Submit",
                      color: Colors.blueGrey,
                      onTap: (){
                        controller.registerCase();
                        if(onTap!=null){
                          onTap!();
                        }
                      },
                    ),
                  ],
                ),
          
                SizedBox(height: 24,),
          
                //forgot password
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