// lib/controllers/home_controller.dart
import 'package:get/get.dart';
import 'package:layout_design/models/hospital.dart';
import 'package:layout_design/models/case.dart';
import 'package:layout_design/helpers/profile_database.dart';
import 'package:layout_design/models/patient.dart';

class CaseListController extends GetxController {
  var cases = <Case>[].obs;
  var filteredCases = <Case>[].obs;
  var hospitals = <Hospital>[].obs;
  var patients = <Patient>[].obs;

  void filterCases(String searchText) {
    if (searchText.isEmpty) {
      filteredCases.value = cases;
    } else {
      filteredCases.value = cases.where((caseR) {
        final patient = patients.firstWhere((p) => p.id == caseR.patientId, orElse: () => Patient(firstName: 'Unknown', lastName: ''));
        final fullName = '${patient.firstName} ${patient.lastName}'.toLowerCase();
        return fullName.contains(searchText.toLowerCase());
      }).toList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadCases();
    loadPatients();
    loadHospitals();
    filteredCases.value = cases;
  }

  void loadCases() async {
    final casesFromDb = await ProfileDatabase().getCases();
    cases.value = casesFromDb.map((caseMap) => Case.fromMap(caseMap)).toList();
  }

  Future<void> loadHospitals() async {
    final db = await ProfileDatabase().database;
    final List<Map<String, dynamic>> maps = await db.query('hospitals');

    hospitals.value = List.generate(maps.length, (i) {
      return Hospital(
        id: maps[i]['id'],
        name: maps[i]['name'] ?? '',
      );
    });
  }

  Future<void> loadPatients() async {
    final db = await ProfileDatabase().database;
    final List<Map<String, dynamic>> maps = await db.query('patients');

    patients.value = List.generate(maps.length, (i) {
      return Patient(
        id: maps[i]['id'],
        firstName: maps[i]['firstName'],
        middleName: maps[i]['middleName'] ?? '',
        lastName: maps[i]['lastName'],
        contactNumber: maps[i]['contactNumber'],
        placeOfWork: maps[i]['placeOfWork'] ?? '',
        address: maps[i]['address'],
        sex: maps[i]['sex'],
        birthday: DateTime.parse(maps[i]['birthday']),
        civilStatus: maps[i]['civilStatus'],
        birthplace: maps[i]['birthplace'],
        ethnicity: maps[i]['ethnicity'],
        language: maps[i]['language'],
      );
    });
  }

  Future<void> addCase(Case caseR) async {
    await ProfileDatabase().insertCase(caseR.toMap());
    loadCases();
  }

  Future<void> updateCase(Case caseR) async {
    await ProfileDatabase().updateCase(caseR.toMap());
    loadCases();
  }

  void deleteCase(int id) async {
    await ProfileDatabase().deleteCase(id);
    loadCases();
  }
}