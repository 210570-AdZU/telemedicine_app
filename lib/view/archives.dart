import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/components/a_popBox.dart';
import 'package:layout_design/components/home_dropdownselect.dart';
import 'package:layout_design/components/my_searchbar.dart';
import 'package:layout_design/components/register_case_button.dart';
import 'package:layout_design/controllers/archives_controller.dart';
import 'package:layout_design/models/archives_model.dart';
import 'package:layout_design/view/case_view.dart';
import 'package:layout_design/view/register_page.dart';

class Archives extends StatelessWidget {
  final ArchivesController controller = Get.put(ArchivesController());
  final Function()? onTap;
  Archives({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      floatingActionButton: RegisterCaseButton(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar and dropdown row
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MySearchbar(),
        
                SizedBox(width: MediaQuery.of(context).size.width * 0.075,),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: HomeDropdownselect(
                    selectList: [
                      '(None)',
                      'Done',
                      'Pending'
                    ],
                  ),
                ),
              ],
            ),
            // List of items
            SizedBox(height:MediaQuery.of(context).size.width * 0.05,),
            Expanded(
              child: ListView.builder(
                itemCount: controller.archiveItem.length,
                itemBuilder: (context, index){
                  ArchivesModel item = controller.archiveItem[index];
                  return APopbox(
                    title: "TEST",
                    onTap: ()=>{Get.toNamed('/caseview')},
                  );
                })
            ),
          ],
        ),
      ),
    );
  }
}
