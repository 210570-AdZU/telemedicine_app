import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/components/home_dropdownselect.dart';
import 'package:layout_design/components/my_searchbar.dart';
import 'package:layout_design/controllers/patient_controller.dart';

class PatientPage extends StatelessWidget {
  final PatientController controller = Get.put(PatientController());
  PatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // This widget will appear right below the AppBar
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MySearchbar(),
        
                SizedBox(width: MediaQuery.of(context).size.width * 0.075,),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: HomeDropdownselect(
                    selectList: ['(None)',
                    'Male',
                    'Female'
                    ],
                  )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}