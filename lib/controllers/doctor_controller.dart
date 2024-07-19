import 'package:get/get.dart';

class DoctorController extends GetxController {
  RxInt _maxItemCount = 0.obs;
  RxInt get maxItemCount => _maxItemCount;
  
  final List<String> dummyData = RxList<String>([
    
  ]);

  void addItem(String item) {
    print(maxItemCount);
    dummyData.add(item);
  }
}
