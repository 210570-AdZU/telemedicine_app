// lib/controllers/home_controller.dart
import 'package:get/get.dart';
import 'package:layout_design/models/profile.dart';
import 'package:layout_design/helpers/profile_database.dart';

class ProfileListController extends GetxController {
  var profiles = <Profile>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProfiles();
  }

  void loadProfiles() async {
    final profilesFromDb = await ProfileDatabase().getProfiles();
    profiles.value = profilesFromDb.map((profileMap) => Profile.fromMap(profileMap)).toList();
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
}