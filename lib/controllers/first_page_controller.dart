import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/components/alt_searchbar.dart';
import 'package:layout_design/components/message_notif.dart';
import 'package:layout_design/components/notif.dart';
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

  void notifOut(){
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createNotifOverlayEntry() {
    return OverlayEntry(
      builder: (context) {
        double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                // Close the overlay when tapped outside
                notifOut();
              },
              child: Container(
                width: screenWidth,
                height: screenHeight,
                color: Colors.transparent, // Transparent background to capture taps
              ),
            ),
            Positioned(
              top: 80,
              right: 10,
              child: Material(
                borderRadius: BorderRadius.circular(4),
                elevation: 4.0,
                child: Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.45,
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Row(
                            children: [
                              Text(
                                "Notifications",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  notifOut();
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(height: 0),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(1),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Notif();
                            },
                          ),
                        ),
                        Divider(),
                        Text('', style: TextStyle(fontSize: 4),)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  OverlayEntry _createMessageNotifOverlayEntry() {
    return OverlayEntry(
      builder: (context) {
        double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                // Close the overlay when tapped outside
                notifOut();
              },
              child: Container(
                width: screenWidth,
                height: screenHeight,
                color: Colors.transparent, // Transparent background to capture taps
              ),
            ),
            Positioned(
              top: 86,
              right: 0,
              child: Material(
                borderRadius: BorderRadius.circular(12),
                elevation: 4.0,
                child: Container(
                  width: screenWidth * 0.925,
                  height: screenHeight * 0.73,
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 0),
                          child: Row(
                            children: [
                              Text(
                                "Chats",
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                icon: Icon(
                                  Icons.close,
                                  size: 18,
                                ),
                                onPressed: () {
                                  notifOut();
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 10, top: 8, bottom: 12),
                          child: Row(
                            children: [
                              AltSearchbar(),
                              Spacer(),
                              Icon(
                                Icons.edit_note_outlined,
                                size: 32,
                                color: Colors.black54,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(1),
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  SizedBox(height: 4,),
                                  MessageNotif(),
                                  Divider(
                                    height: 0,
                                    color: Colors.black12,
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "See all messages",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void showNotifOverlay(BuildContext context) {
    if (_overlayEntry == null) {
      _overlayEntry = _createNotifOverlayEntry();
      Overlay.of(context)?.insert(_overlayEntry!);
    }
  }

  void showMessageNotifOverlay(BuildContext context) {
    if (_overlayEntry == null) {
      _overlayEntry = _createMessageNotifOverlayEntry();
      Overlay.of(context)?.insert(_overlayEntry!);
    }
  }


}
