import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:layout_design/components/my_numberfield.dart';
import 'package:layout_design/controllers/case_controller.dart';
import 'package:layout_design/controllers/case_list_controller.dart';
import '../components/my_textfield.dart';
import '../components/register_dropdownselect.dart';
import '../components/account_button.dart';

class RegisterCasePage extends StatelessWidget {
  final CaseController caseController = Get.put(CaseController());
  final CaseListController caseListController = Get.put(CaseListController());
  final Function()? onTap;
  // String emailRegex = r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0 -9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}";
  RegisterCasePage({
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                //logo
                children: [
                //company
                Text(
                  'Register Case',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade800
                    ),
                  textAlign: TextAlign.left,
                  ),
                ],
              ),
          
                SizedBox(height: 18,),

                Text(
                  "Patient",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),

                SizedBox(height: 8,),

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
                    value: caseController.patientIdController.value,
                    hint: Text('Select Patient'),
                    items: caseListController.patients.map((patient) {
                      return DropdownMenuItem<int>(
                        value: patient.id,
                        child: Text(
                          patient.middleName!.isEmpty
                          ? patient.firstName + patient.lastName
                          : patient.firstName + ' ' + patient.middleName! + ' ' + patient.lastName,
                          style: TextStyle(
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        caseController.patientIdController.value = value;
                      }
                    },
                  );
                }),

                SizedBox(height: 6,),

                Text(
                  "Hospital",
                  style: TextStyle(
                    fontSize: 14
                  ),
                ),

                SizedBox(height: 8,),

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
                    value: caseController.hospitalIdController.value,
                    hint: Text('Select Hospital'),
                    items: caseListController.hospitals.map((hospital) {
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
                        caseController.patientIdController.value = value;
                      }
                    },
                  );
                }),

                SizedBox(height: 26,),

                Text(
                  "Temperature",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),

                SizedBox(height: 10,),

                MyNumberfield(
                  identifier: "temperature",
                  hintText: "  Enter Temperature",
                  fontSize: 18,
                  isCollapsed: true,
                  obscureText: false,
                  controller: caseController.temperatureController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => caseController.updateTemperature(),
                ),

                SizedBox(height: 18,),

                Text(
                  "Respiration",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),

                SizedBox(height: 10,),

                MyNumberfield(
                  identifier: "respiration",
                  hintText: "  Enter Respiration",
                  fontSize: 18,
                  isCollapsed: true,
                  obscureText: false,
                  controller: caseController.respiratoryController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => caseController.updateRespiratory(),
                ),

                SizedBox(height: 18,),

                Text(
                  "Heart",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),

                SizedBox(height: 10,),
                
                MyNumberfield(
                  identifier: "heart status",
                  hintText: "  Enter Heart Status",
                  fontSize: 18,
                  isCollapsed: true,
                  obscureText: false,
                  controller: caseController.heartController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => caseController.updateHeart(),
                ),

                SizedBox(height: 18,),

                Text(
                  "Blood",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),

                SizedBox(height: 10,),
                
                MyNumberfield(
                  identifier: "blood status",
                  hintText: "  Enter Blood Status",
                  fontSize: 18,
                  isCollapsed: true,
                  obscureText: false,
                  controller: caseController.bloodController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => caseController.updateBlood(),
                ),

                SizedBox(height: 18,),

                Text(
                  "Oxygen",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),

                SizedBox(height: 8,),
                
                MyNumberfield(
                  identifier: "oxygen status",
                  hintText: "  Enter Oxygen Status",
                  fontSize: 18,
                  isCollapsed: true,
                  obscureText: false,
                  controller: caseController.oxygenController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => caseController.updateOxygen(),
                ),

                SizedBox(height: 18,),

                Text(
                  "Weight",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),

                SizedBox(height: 8,),
                
                MyNumberfield(
                  identifier: "weight",
                  hintText: "  Enter Weight",
                  fontSize: 18,
                  isCollapsed: true,
                  obscureText: false,
                  controller: caseController.weightController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => caseController.updateWeight(),
                ),

                SizedBox(height: 18,),

                Text(
                  "Height",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),

                SizedBox(height: 8,),
                
                MyNumberfield(
                  identifier: "height",
                  hintText: "  Enter Height",
                  fontSize: 18,
                  isCollapsed: true,
                  obscureText: false,
                  controller: caseController.heightController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => caseController.updateHeight(),
                ),
          
                SizedBox(height: 18,),

                Text(
                  "Chief complaint",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),

                SizedBox(height: 8,),
                
                MyTextfield(
                  identifier: "chief complaint",
                  hintText: "  Enter Chief Complaint",
                  fontSize: 18,
                  contentPadding: EdgeInsets.fromLTRB(12, 4, 8, 44),
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  isCollapsed: true,
                  obscureText: false,
                  controller: caseController.ccController,
                ),
          
                SizedBox(height: 18,),

                Text(
                  "History of present illness",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),

                SizedBox(height: 8,),
                
                MyTextfield(
                  identifier: "history of present illness",
                  hintText: "  Enter History of Present Illness",
                  fontSize: 18,
                  contentPadding: EdgeInsets.fromLTRB(12, 4, 8, 44),
                  isCollapsed: true,
                  obscureText: false,
                  controller: caseController.hpiController,
                ),
          
                SizedBox(height: 18,),

                Text(
                  "Past medical history",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),

                SizedBox(height: 8,),
                
                MyTextfield(
                  identifier: "past medical history",
                  hintText: "  Enter Past Medical History",
                  fontSize: 18,
                  contentPadding: EdgeInsets.fromLTRB(12, 4, 8, 44),
                  isCollapsed: true,
                  obscureText: false,
                  controller: caseController.pmhController,
                ),
          
                SizedBox(height: 18,),

                Text(
                  "Review of system",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
                SizedBox(height: 18,),

                Text(
                  "Physical examination",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),

                SizedBox(height: 8,),
                
                MyTextfield(
                  identifier: "physical examination",
                  hintText: "  Enter Physical Examination",
                  fontSize: 18,
                  contentPadding: EdgeInsets.fromLTRB(12, 4, 8, 44),
                  isCollapsed: true,
                  obscureText: false,
                  controller: caseController.peController,
                ),
          
                SizedBox(height: 18,),

                Text(
                  "Ward information",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),

                SizedBox(height: 8,),
                
                MyTextfield(
                  identifier: "ward information",
                  hintText: "  Enter Ward Information",
                  fontSize: 18,
                  contentPadding: EdgeInsets.fromLTRB(12, 4, 8, 44),
                  isCollapsed: true,
                  obscureText: false,
                  controller: caseController.wiController,
                ),
          
                SizedBox(height: 18,),

                Text(
                  "Inherited medical disorders",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),

                SizedBox(height: 8,),
                
                MyTextfield(
                  identifier: "inherited medical disorders",
                  hintText: "  Enter Inherited Medical Disorders",
                  fontSize: 18,
                  contentPadding: EdgeInsets.fromLTRB(12, 4, 8, 44),
                  isCollapsed: true,
                  obscureText: false,
                  controller: caseController.imdController,
                ),
          
                SizedBox(height: 18,),

                Text(
                  "Reason",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),

                SizedBox(height: 8,),
                
                MyTextfield(
                  identifier: "reason",
                  hintText: "  Enter Reason",
                  fontSize: 18,
                  contentPadding: EdgeInsets.fromLTRB(12, 4, 8, 44),
                  isCollapsed: true,
                  obscureText: false,
                  controller: caseController.reasonController,
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
                        caseController.registerCase();
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