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
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            children: [
              Image.asset(
                  'lib/assets/images/Removal-432.png',
                  fit: BoxFit.fill,
                  width: 43,
                  height: 58,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.075,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Telemedicine Web App',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 1,
                    width: 208,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black26,
                      ),
                    ),
                  ),
                  Text(
                    ' Zamboanga City Medical Center',
                    style: TextStyle(
                      fontSize: 14,
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
            SizedBox(height: 4,),
            Text(
              "Device Logs",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "\nYour previous login to devices is recorded here. This log includes information about "
              "the devices you've used to access our platform, along with the login timestamps, ip "
              "address and type of device. Keeping track of your device log helps ensure the security "
              "of your account and allows you to monitor any unauthorized access.",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 40,),
            Divider(
              height: 12,
              thickness: 2,
              color: Colors.grey.shade300,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.deviceItem.length,
                itemBuilder: (context, index){
                  DeviceLogModel item = controller.deviceItem[index];
                  return Column(
                    children: [
                      DeviceLogBox(
                        deviceType: item.deviceType,
                        deviceIcon: item.deviceIcon,
                      ),
                      Divider(
                        height: 12,
                        thickness: 2,
                        color: Colors.grey.shade300,
                      )
                    ],
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