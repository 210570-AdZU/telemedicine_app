import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/components/device_log_box.dart';
import 'package:layout_design/controllers/device_log_controller.dart';
import 'package:layout_design/models/device_log_model.dart';

class DeviceLogs extends StatelessWidget {
  final DeviceLogController controller = Get.put(DeviceLogController());
  DeviceLogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(width: 40, child: Image.asset('lib/assets/images/Removal-432.png')),
              SizedBox(width: MediaQuery.of(context).size.width * 0.075,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                children: [
                  Text(
                    'Telemedicine Web App',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    ' Zamboanga City Medical Center',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
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
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Device Logs",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "\nYour previous login to devices is recorded here. This log includes information about the devices you've used to access our platform, along with the login timestamps, ip address and type of device. Keeping track of your device log helps ensure the security of your account and allows you to monitor any unauthorized access.",
              style: TextStyle(
                fontSize: 14.3,
              ),
              textAlign: TextAlign.justify,
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.deviceItem.length,
                itemBuilder: (context, index){
                  DeviceLogModel item = controller.deviceItem[index];
                  return DeviceLogBox(
                    deviceType: item.deviceType,
                    deviceIcon: item.deviceIcon,
                  );
                }
              ),
            ),
          ],
        ),
      ),
      );
  }
}