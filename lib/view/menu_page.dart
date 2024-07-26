import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/components/account_button.dart';
import 'package:layout_design/controllers/menu_page_controller.dart';
import 'package:layout_design/controllers/auth_controller.dart';

class MenuPage extends StatelessWidget {
  final MenuPageController controller = Get.put(MenuPageController());
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Adjust the height as needed
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 16), // Adjust the vertical padding as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 56,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: MediaQuery.of(context).size.width * 0.072,
                        child: Center(
                          child: Text(
                            authController.fNameController.text[0].toUpperCase() +
                                authController.lNameController.text[0].toUpperCase(),
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded( // Wrap Text with Expanded to avoid overflow issues
                      child: Text(
                        authController.fNameController.text +
                            ' ' +
                            authController.mNameController.text +
                            ' ' +
                            authController.lNameController.text,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        overflow: TextOverflow.ellipsis, // Add overflow handling
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 100),
                Divider(height: 0),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Profile"),
                  onTap: () {
                    Get.to(() => (controller.pages[0]));
                  },
                ),
                Divider(height: 0),
                ListTile(
                  leading: Icon(Icons.more_horiz),
                  title: Text("Change Password"),
                  onTap: () {
                    Get.to(() => (controller.pages[1]));
                  },
                ),
                Divider(height: 0),
                ListTile(
                  leading: Icon(Icons.monitor_outlined),
                  title: Text("Device Log"),
                  onTap: () {
                    Get.to(() => (controller.pages[2]));
                  },
                ),
                Divider(height: 0),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text("Terms and Conditions"),
                  onTap: () {
                    Get.to(() => (controller.pages[3]));
                  },
                ),
                Divider(height: 0),
                ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text("About Us"),
                  onTap: () {
                    Get.to(() => (controller.pages[4]));
                  },
                ),
                Divider(height: 0),
              ],
            ),
            Container(
              child: AccountButton(
                text: 'Logout',
                onTap: authController.logout,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
