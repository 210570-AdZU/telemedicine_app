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
            SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                MySearchbar(),
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
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: controller.archiveItem.length,
                itemBuilder: (context, index){
                  ArchivesModel item = controller.archiveItem[index];
                  return APopbox(
                    title: "Maria N. Thanos",
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
