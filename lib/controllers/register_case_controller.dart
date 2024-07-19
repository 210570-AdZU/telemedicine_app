import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/view/first_page.dart';

class RegisterCaseController extends GetxController{
  TextEditingController temperatureController = TextEditingController();
  TextEditingController respirationController = TextEditingController();
  TextEditingController heartController = TextEditingController();
  TextEditingController bloodController = TextEditingController();
  TextEditingController oxygenController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController complaintController = TextEditingController();
  TextEditingController illnessController = TextEditingController();
  TextEditingController pastHistController = TextEditingController();
  TextEditingController reviewController = TextEditingController();
  TextEditingController examinationController = TextEditingController();
  TextEditingController wardInfoController = TextEditingController();
  TextEditingController inheritedDisorderController = TextEditingController();
  TextEditingController reasonController = TextEditingController();

  void registerCase(){
    if (temperatureController.text.isEmpty||respirationController.text.isEmpty||heartController.text.isEmpty||bloodController.text.isEmpty||oxygenController.text.isEmpty||weightController.text.isEmpty||heightController.text.isEmpty||complaintController.text.isEmpty||illnessController.text.isEmpty||pastHistController.text.isEmpty||reviewController.text.isEmpty||examinationController.text.isEmpty||wardInfoController.text.isEmpty||inheritedDisorderController.text.isEmpty||reasonController.text.isEmpty) {
      Get.dialog(
        AlertDialog(
          title: Text("Incomplete Info"),
          content: Text("Fill up all fields."),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text("OK"),
            ),
          ],
        ),
      );
    } else {
      // Proceed with login
      Get.dialog(
        AlertDialog(
          title: Text("Case registered"),
          content: Text("You may view it in Archives"),
          actions: [
            TextButton(
              onPressed: (() => {Get.back()}),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }
}