import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:layout_design/components/a_popBox.dart';
import 'package:layout_design/components/home_dropdownselect.dart';
import 'package:layout_design/components/my_searchbar.dart';
import 'package:layout_design/components/register_case_button.dart';
import 'package:layout_design/models/archives_model.dart';
import 'package:layout_design/models/patient.dart';
import 'package:layout_design/view/case_view.dart';
import 'package:layout_design/view/register_page.dart';
import 'package:path/path.dart';

import '../controllers/case_list_controller.dart';
import '../models/hospital.dart';

class Archives extends StatelessWidget {
  final CaseListController caseListController = Get.put(CaseListController());
  final Function()? onTap;

  final TextEditingController searchController = TextEditingController();

  Archives({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    caseListController.loadCases();
    searchController.addListener(() {
      caseListController.filterCases(searchController.text);
    });
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      floatingActionButton: RegisterCaseButton(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                MySearchbar(searchController: searchController,),
                SizedBox(width: MediaQuery.of(context).size.width * 0.13,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: HomeDropdownselect(
                    selectList: ['All'],
                  ),
                ),
              ],
            ),
            SizedBox(height:MediaQuery.of(context).size.width * 0.09,),
            Expanded(
              child: Obx(() => GridView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: caseListController.filteredCases.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2.2,
                  ),
                  itemBuilder: (context, index) {
                    final caseR = caseListController.filteredCases[index];

                    final hospital = caseListController.hospitals.firstWhere(
                      (h) => h.id == caseR.hospitalId,
                      orElse: () => Hospital(id: 0, name: 'Unknown Hospital'),
                    );
                    final patient = caseListController.patients.firstWhere(
                      (p) => p.id == caseR.patientId,
                      /*orElse: () => Patient(
                        id: 0,
                        firstName: 'Unknown',
                        lastName: '',
                        contactNumber: '',
                        address: '',
                        sex: '',
                        birthday: DateFormat('yyyy-MM-dd').parse('1970-01-01'),
                        civilStatus: '',
                        birthplace: '',
                        ethnicity: '',
                        language: '', 
                      ),*/
                    );

                    return Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.037,),
                        APopbox(
                          name: patient.firstName + ' ' + patient.lastName,
                          age: '${(DateTime.now().year - (patient.birthday?.year ?? 0))}'
                          '${((DateTime.now().year - (patient.birthday?.year ?? 0)) == 1) ? ' yr' : ' yrs'}',
                          sex: '${patient.sex}',
                          hospital: hospital.name,
                          patientId: '#${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}${caseR.patientId}',
                          onTap: () {Get.to(() => CaseView(cases: caseR, patients: patient, hospitals: hospital,));},
                          chat: () {
                            //Get.toNamed('/chatroom');
                          },
                        ),
                      ],
                    );
                  },
              )),
            ),
          ],
        ),
      ),
    );
  }
}