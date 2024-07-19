import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/components/message_notif.dart';
import 'package:layout_design/view/archives.dart';
import 'package:layout_design/view/doctor_page.dart';
import 'package:layout_design/view/patient_page.dart';

class FirstPageController extends GetxController {
  OverlayEntry? _overlayEntry;
  var selectedIndex = 0.obs;
  RxInt pageNum = 0.obs;

  final List<Widget> pages = [
    DoctorPage(),
    PatientPage(),
    Archives(),
  ];

  @override
  void onInit() {
    super.onInit();
    pageNum.value = pages.length;
  }

  void navigateToPage(int index) {
    selectedIndex.value = index;
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) {
        double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;
        return Positioned(
          top: 80,
          right: 10,
          child: Material(
            borderRadius: BorderRadius.circular(4),
            elevation: 4.0,
            child: Container(
              width: screenWidth * 0.8,
              height: screenHeight * 0.5,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8,),
                      child: Row(
                        children: [
                          Text(
                            "Notifications",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              _overlayEntry?.remove();
                              _overlayEntry = null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 0,),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8), // Ensure padding here
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return MessageNotif();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void showOverlay(BuildContext context) {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }
}
