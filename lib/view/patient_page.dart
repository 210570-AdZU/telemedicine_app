import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/components/home_dropdownselect.dart';
import 'package:layout_design/components/my_searchbar.dart';
import 'package:layout_design/controllers/case_list_controller.dart';

import '../components/a_popBox.dart';
import '../components/d_popBox.dart';

class PatientPage extends StatelessWidget {
  final CaseListController caseListController = Get.put(CaseListController());
  PatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                //MySearchbar(searchController: ,),
                SizedBox(width: MediaQuery.of(context).size.width * 0.13,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: HomeDropdownselect(
                    selectList: ['All', 'Test', 'What'],
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.037,),
          ],
        ),
      ),
    );
  }
}