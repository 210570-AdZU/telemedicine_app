// lib/controllers/case_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:layout_design/helpers/profile_database.dart';
import 'package:layout_design/models/case.dart';

class CaseController extends GetxController {
  var temperatureValue = Rxn<double>(0.0);
  var respiratoryValue = Rxn<int>();
  var heartValue = Rxn<int>();
  var bloodValue = Rxn<int>();
  var oxygenValue = Rxn<double>(0.0);
  var weightValue = Rxn<double>(0.0);
  var heightValue = Rxn<double>(0.0);
  var temperatureController = TextEditingController();
  var respiratoryController = TextEditingController();
  var heartController = TextEditingController();
  var bloodController = TextEditingController();
  var oxygenController = TextEditingController();
  var weightController = TextEditingController();
  var heightController = TextEditingController();
  var ccController = TextEditingController();
  var hpiController = TextEditingController();
  var pmhController = TextEditingController();
  var peController = TextEditingController();
  var wiController = TextEditingController();
  var imdController = TextEditingController();
  var reasonController = TextEditingController();
  var patientIdController = Rxn<int>();
  var hospitalIdController = Rxn<int>();

  void updateTemperature() {
    temperatureValue.value = double.tryParse(temperatureController.text);
  }

  void updateRespiratory() {
    respiratoryValue.value = int.tryParse(respiratoryController.text);
  }

  void updateHeart() {
    heartValue.value = int.tryParse(heartController.text);
  }

  void updateBlood() {
    bloodValue.value = int.tryParse(bloodController.text);
  }

  void updateOxygen() {
    oxygenValue.value = double.tryParse(oxygenController.text);
  }

  void updateWeight() {
    weightValue.value = double.tryParse(weightController.text);
  }

  void updateHeight() {
    heightValue.value = double.tryParse(heightController.text);
  }

Future<void> registerCase() async {
  try {
    final caseR = Case(
      temperature: temperatureValue.value ?? 0,
      respiratory: respiratoryValue.value ?? 0,
      heart: heartValue.value ?? 0,
      blood: bloodValue.value ?? 0,
      oxygen: oxygenValue.value ?? 0,
      weight: weightValue.value ?? 0,
      height: heightValue.value ?? 0,
      cc: ccController.text,
      hpi: hpiController.text,
      pmh: pmhController.text,
      pe: peController.text,
      wi: wiController.text,
      imd: imdController.text,
      reason: reasonController.text,
      hospitalId: hospitalIdController.value ?? -1,
      patientId: patientIdController.value ?? -1,
    );

    final result = await ProfileDatabase().insertCase(caseR.toMap()); 
    if (result > 0) { // Check for a positive result
      temperatureValue.value=0.0;
      respiratoryValue.value=null;
      heartValue.value=null;
      bloodValue.value=null;
      oxygenValue.value=null;
      weightValue.value=null;
      heightValue.value=null;
      temperatureController.clear();
      respiratoryController.clear();
      heartController.clear();
      bloodController.clear();
      oxygenController.clear();
      weightController.clear();
      heightController.clear();
      ccController.clear();
      hpiController.clear();
      pmhController.clear();
      peController.clear();
      wiController.clear();
      imdController.clear();
      reasonController.clear();
      hospitalIdController.value=null;
      patientIdController.value=null;
      Get.snackbar('Success', 'Case registered successfully');
    } else {
      final cases  = await ProfileDatabase().getCases();
      print(cases.first.isEmpty);
      Get.snackbar('Error', 'Failed to register case');
    }
  } catch (e) {
    Get.snackbar('Error', 'Failed to register case: $e');
  }
}

}