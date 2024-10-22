import 'package:flutter/material.dart';

class DeviceLogBox extends StatefulWidget {
  final String deviceType;
  final IconData deviceIcon;
  const DeviceLogBox({
    Key? key,
    required this.deviceType,
    required this.deviceIcon
  }) : super(key: key);

  @override
  State<DeviceLogBox> createState() => _DeviceLogBox();
}

class _DeviceLogBox extends State<DeviceLogBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      widget.deviceIcon,
                      color: Colors.black87,
                    ),
                    SizedBox(width: 5),
                    Text(
                      widget.deviceType,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_searching,
                      color: Colors.black87,
                    ),
                    SizedBox(width: 5),
                    Text("192.168.1.1"),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Colors.black87,
                      ),
                    SizedBox(width: 5),
                    Text(
                      "April 24, 2024",
                      style: TextStyle(
                        fontSize: 16
                      ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
