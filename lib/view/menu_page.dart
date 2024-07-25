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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              width: 56,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: MediaQuery.of(context).size.width * 0.072,
                child: Center(
                  child: Text(
                    authController.fNameController.text[0].toUpperCase() + authController.lNameController.text[0].toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
                )
              )
            ),
            SizedBox(width: 8,),
            Text(
              authController.fNameController.text + ' ' + authController.mNameController.text + ' ' + authController.lNameController.text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ],
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
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 120,),
                Divider(height: 0,),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Profile"),
                  onTap: () {
                    Get.to(() =>(controller.pages[0]));
                  },
                ),
                Divider(height: 0,),
                ListTile(
                  leading: Icon(Icons.more_horiz),
                  title: Text("Change Password"),
                  onTap: () {
                    Get.to(() =>(controller.pages[1]));
                  },
                ),
                Divider(height: 0,),
                ListTile(
                  leading: Icon(Icons.monitor_outlined),
                  title: Text("Device Log"),
                  onTap: () {
                    Get.to(() =>(controller.pages[2]));
                  },
                ),
                Divider(height: 0,),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text("Terms and Conditions"),
                  onTap: () {
                    Get.to(() =>(controller.pages[3]));
                  },
                ),
                Divider(height: 0,),
                ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text("About Us"),
                  onTap: () {
                    Get.to(() =>(controller.pages[4]));
                  },
                ),
                Divider(height: 0,),
              ],
            ),
            Container(
              child: AccountButton(text: 'Logout', onTap: authController.logout, color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}