import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:layout_design/components/call_button.dart';
import 'package:layout_design/components/case_end_box.dart';
import 'package:layout_design/components/case_head_box.dart';
import 'package:layout_design/components/case_mid_box.dart';
import 'package:layout_design/components/follow_up_button.dart';

import '../models/case.dart';
import '../models/hospital.dart';
import '../models/patient.dart';

class CaseView extends StatefulWidget {
  final Case? cases;
  final Patient? patients;
  final Hospital? hospitals;
  final Function()? onTap;
  CaseView({
    super.key,
    this.onTap,
    this.cases,
    this.patients,
    this.hospitals,
  });

  @override
  State<CaseView> createState() => _CaseViewState();
}

class _CaseViewState extends State<CaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 72.0, right: 0.0),
              child: CallButton(),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0, right: 0.0),
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
              CaseHeadBox(
                name: '${widget.patients?.lastName}, ${widget.patients?.firstName} ${widget.patients?.middleName}',
                id: '#${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}${widget.patients?.id}',
                test: 'test',
                hospital: 'test',
                onTap: (){print('test');}),
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
                        '${widget.patients?.lastName}, ${widget.patients?.firstName} ${widget.patients?.middleName}',
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
                        '${DateTime.now().year - (widget.patients?.birthday?.year ?? 0)}'
                        '${((DateTime.now().year - (widget.patients?.birthday?.year ?? 0)) == 1) ? ' yr' : ' yrs'}'
                        ' (${widget.patients?.birthday?.year}'
                        '-${widget.patients?.birthday?.month}'
                        '-${widget.patients?.birthday?.day})',
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
                        '${widget.patients?.sex}',
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
                        '${widget.patients?.civilStatus}',
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
                        '${widget.patients?.contactNumber}',
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
                        '${widget.patients?.birthplace}',
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
                        '${widget.patients?.ethnicity}',
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
                        '${widget.patients?.language}',
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
                        '${widget.patients?.address}',
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
                  CaseMidBox(
                    onTap: (){},
                    detail: "Temperature",
                    value: widget.cases?.temperature.toDouble(),
                    icon: Icons.thermostat_outlined,
                    iconColor: Colors.blueAccent,),
                  SizedBox(width: 8,),
                  CaseMidBox(
                    onTap: (){},
                    detail: "Respiratory Rate",
                    value: widget.cases?.respiratory.toDouble(),
                    icon: Icons.air_outlined,),
                ],
              ),
              SizedBox(height: 16,),
              Row(
                children: [
                  CaseMidBox(
                    onTap: (){},
                    detail: "Heart Rate",
                    value: widget.cases?.heart.toDouble(),
                    icon: Icons.monitor_heart,
                    iconColor: Colors.red,
                    ),
                  SizedBox(width: 8,),
                  CaseMidBox(
                    onTap: (){},
                    detail: "Blood Pressure",
                    value: widget.cases?.blood.toDouble(),
                    icon: Icons.bloodtype,
                    iconColor: Colors.red,
                    ),
                ],
              ),
              SizedBox(height: 16,),
              Row(
                children: [
                  CaseMidBox(
                    onTap: (){},
                    detail: "Respiratory Rate",
                    value: widget.cases?.respiratory.toDouble(),
                    icon: Icons.ring_volume,
                    iconColor: Colors.green,
                    ),
                  SizedBox(width: 8,),
                  CaseMidBox(
                    onTap: (){},
                    detail: "Blood Pressure",
                    value: widget.cases?.blood.toDouble(),
                    icon: Icons.line_weight,
                    iconColor: Colors.black45,
                    ),
                ],
              ),
              SizedBox(height: 16,),
              Row(
                children: [
                  CaseMidBox(
                    onTap: (){},
                    detail: "Heart Rate",
                    value: widget.cases?.heart.toDouble(),
                    icon: Icons.personal_injury,
                    iconColor: Colors.black45,
                    ),
                ],
              ),
              SizedBox(height: 18,),
              CaseEndBox(onTap: (){}, title: "CHIEF COMPLAINT", text: '${widget.cases?.cc}',),
              SizedBox(height: 18,),
              CaseEndBox(onTap: (){}, title: "PERTINENT HISTORY OF PRESENT ILLNESS", text: '${widget.cases?.hpi}',),
              SizedBox(height: 18,),
              CaseEndBox(onTap: (){}, title: "PERTINENT PAST MEDCIAL HISTORY", text: '${widget.cases?.pmh}',),
              SizedBox(height: 18,),
              CaseEndBox(onTap: (){}, title: "PERTINENT PE FINDINGS", text: '${widget.cases?.pe}',),
              SizedBox(height: 18,),
              CaseEndBox(onTap: (){}, title: "WORKING IMPRESSION", text: '${widget.cases?.wi}',),
              SizedBox(height: 18,),
              CaseEndBox(onTap: (){}, title: "INITIAL MANAGEMENT DONE", text: '${widget.cases?.imd}',),
              SizedBox(height: 18,),
              CaseEndBox(onTap: (){}, title: "REASON FOR REFERRAL", text: '${widget.cases?.reason}',),
            ],
          ),
        ),
      ),
    );
  }
}