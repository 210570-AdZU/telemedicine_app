import 'package:get/get.dart';
import 'package:layout_design/models/archives_model.dart';
class ArchivesController extends GetxController{
  RxList<ArchivesModel> archiveItem = <ArchivesModel>[
    ArchivesModel(title: "Test"),
  ].obs;
}