import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:layout_design/components/call_button.dart';
import 'package:layout_design/components/case_end_box.dart';
import 'package:layout_design/components/case_head_box.dart';
import 'package:layout_design/components/case_mid_box.dart';
import 'package:layout_design/components/follow_up_button.dart';

class CaseView extends StatelessWidget {
  final Function()? onTap;
  CaseView({
    super.key,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 72.0, right: 0.0), // Adjust for spacing
              child: CallButton(),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0, right: 0.0), // Adjust for spacing
              child: FollowUpButton(),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: Center(
          child: Text(
            "Case Information",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black54
            ),
          )
        ),
        actions: [
          PopupMenuButton<int>(
            onSelected: (int result) {
              // Handle item selection
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.shield, color: Colors.black45),
                    SizedBox(width: 10),
                    Text('Add Specialty'),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Row(
                  children: [
                    Icon(Icons.archive, color: Colors.orange),
                    SizedBox(width: 10),
                    Text('Archive Case'),
                  ],
                ),
              ),
              PopupMenuDivider(),
              PopupMenuItem<int>(
                value: 3,
                child: Row(
                  children: [
                    Icon(Icons.swap_horiz_sharp, color: Colors.black54),
                    SizedBox(width: 10),
                    Text('Archive Case'),
                  ],
                ),
              ),
            ]
          )
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CaseHeadBox(onTap: (){}),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 76,
                    height: 76,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black12,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.person,
                            size: 76,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name(Last, First Mi):",
                        style: TextStyle(
                          fontSize: 11
                        ),
                      ),
                      Text(
                        "Thanos, Maria Noresa",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "Age:",
                        style: TextStyle(
                          fontSize: 11
                        ),
                      ),
                      Text(
                        "2yrs(02/10/2022)",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sex:",
                        style: TextStyle(
                          fontSize: 11
                        ),
                      ),
                      Text(
                        "Male",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Civil Status:",
                        style: TextStyle(
                          fontSize: 11
                        ),
                      ),
                      Text(
                        "Single",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Contact:",
                        style: TextStyle(
                          fontSize: 11
                        ),
                      ),
                      Text(
                        "09123456789",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Birthplace:",
                        style: TextStyle(
                          fontSize: 11
                        ),
                      ),
                      Text(
                        "undefined",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ethnicity:",
                        style: TextStyle(
                          fontSize: 11
                        ),
                      ),
                      Text(
                        "Zamboangueno",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 14,),
              Row(
                children: [ 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dialect:",
                        style: TextStyle(
                          fontSize: 11
                        ),
                      ),
                      Text(
                        "Chavacano",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12,),
              Row(
                children: [ 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Address(Street, Barangay, City):",
                        style: TextStyle(
                          fontSize: 11
                        ),
                      ),
                      Text(
                        "1st Street, Zambowood, Zamboanga City",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16,),
              Row(
                children: [
                  CaseMidBox(onTap: (){}, detail: "Temperature", icon: Icons.thermostat_outlined, iconColor: Colors.blueAccent,),
                  SizedBox(width: 8,),
                  CaseMidBox(onTap: (){}, detail: "Respiratory Rate", icon: Icons.air_outlined,),
                ],
              ),
              SizedBox(height: 16,),
              Row(
                children: [
                  CaseMidBox(onTap: (){}, detail: "Heart Rate", icon: Icons.monitor_heart, iconColor: Colors.red,),
                  SizedBox(width: 8,),
                  CaseMidBox(onTap: (){}, detail: "Blood Pressure", icon: Icons.bloodtype, iconColor: Colors.red,),
                ],
              ),
              SizedBox(height: 16,),
              Row(
                children: [
                  CaseMidBox(onTap: (){}, detail: "Respiratory Rate", icon: Icons.ring_volume, iconColor: Colors.green,),
                  SizedBox(width: 8,),
                  CaseMidBox(onTap: (){}, detail: "Blood Pressure", icon: Icons.line_weight, iconColor: Colors.black45,),
                ],
              ),
              SizedBox(height: 16,),
              Row(
                children: [
                  CaseMidBox(onTap: (){}, detail: "Heart Rate", icon: Icons.personal_injury, iconColor: Colors.black45,),
                ],
              ),
              SizedBox(height: 18,),
              CaseEndBox(onTap: (){}, title: "CHIEF COMPLAINT", text: "Testa",),
              SizedBox(height: 18,),
              CaseEndBox(onTap: (){}, title: "PERTINENT HISTORY OF PRESENT ILLNESS", text: "Testa",),
              SizedBox(height: 18,),
              CaseEndBox(onTap: (){}, title: "PERTINENT PAST MEDCIAL HISTORY", text: "Testa",),
              SizedBox(height: 18,),
              CaseEndBox(onTap: (){}, title: "PERTINENT PE FINDINGS", text: "Testa",),
              SizedBox(height: 18,),
              CaseEndBox(onTap: (){}, title: "WORKING IMPRESSION", text: "Testa",),
              SizedBox(height: 18,),
              CaseEndBox(onTap: (){}, title: "INITIAL MANAGEMENT DONE", text: "Testa",),
              SizedBox(height: 18,),
              CaseEndBox(onTap: (){}, title: "REASON FOR REFERRAL", text: "Testa",),
            ],
          ),
        ),
      ),
    );
  }
}