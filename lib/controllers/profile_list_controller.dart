// lib/controllers/home_controller.dart
import 'package:get/get.dart';
import 'package:layout_design/models/hospital.dart';
import 'package:layout_design/models/profile.dart';
import 'package:layout_design/helpers/profile_database.dart';
import 'package:layout_design/models/specialization.dart';

class ProfileListController extends GetxController {
  var profiles = <Profile>[].obs;
  var filteredProfiles = <Profile>[].obs;
  var hospitals = <Hospital>[].obs;
  var specializations = <Specialization>[].obs;

  void filterProfiles(String searchText) {
    if (searchText.isEmpty) {
      filteredProfiles.value = profiles;
    } else {
      filteredProfiles.value = profiles.where((profile) {
        final fullName = '${profile.fName} ${profile.mName} ${profile.lName}'.toLowerCase();
        return fullName.contains(searchText.toLowerCase());
      }).toList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadProfiles();
    loadHospitals();
    loadSpecializations();
    filteredProfiles.value = profiles;
  }

  void loadProfiles() async {
    final profilesFromDb = await ProfileDatabase().getProfiles();
    profiles.value = profilesFromDb.map((profileMap) => Profile.fromMap(profileMap)).toList();
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

  Future<void> loadSpecializations() async {
    final db = await ProfileDatabase().database;
    final List<Map<String, dynamic>> maps = await db.query('specializations');

    specializations.value = List.generate(maps.length, (i) {
      return Specialization(
        id: maps[i]['id'],
        name: maps[i]['name'],
        description: maps[i]['description'] ?? '',
      );
    });
  }

  Future<void> addProfile(Profile profile) async {
    await ProfileDatabase().insertProfile(profile.toMap());
    loadProfiles();
  }

  Future<void> updateProfile(Profile profile) async {
    await ProfileDatabase().updateProfile(profile.toMap());
    loadProfiles();
  }

  void deleteProfile(int id) async {
    await ProfileDatabase().deleteProfile(id);
    loadProfiles();
  }

  // Future<void> deleteProfile(int id) async {
  //   final db = await ProfileDatabase().database;
  //   await db.delete('users', where: 'id = ?', whereArgs: [id]);
  //   loadProfiles();
  // }
}