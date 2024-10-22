import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/models/device_log_model.dart';
class DeviceLogController extends GetxController{
  RxList<DeviceLogModel> deviceItem = <DeviceLogModel>[
    DeviceLogModel(
      deviceType: 'Android Phone',
      deviceIcon: Icons.phone_android
    ),
    DeviceLogModel(
      deviceType: 'Desktop',
      deviceIcon: Icons.desktop_windows
    ),
    DeviceLogModel(
      deviceType: 'Tablet',
      deviceIcon: Icons.tablet_android
    ),
    DeviceLogModel(
      deviceType: 'IPhone',
      deviceIcon: Icons.phone_iphone,
    ),
  ].obs;
}