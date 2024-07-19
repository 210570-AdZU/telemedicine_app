import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/controllers/doctor_controller.dart';
class AddminButton extends StatefulWidget {
  AddminButton({super.key});

  @override
  State<AddminButton> createState() => _ButtonState();
}

class _ButtonState extends State<AddminButton> {
  final DoctorController controller = Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(32),
        child: InkWell(
          onTap: () {
            controller.maxItemCount.value++;
            controller.addItem("Dennis Clone #" + controller.maxItemCount.obs.string);
          },
          borderRadius: BorderRadius.circular(32),
          child: Container(
            constraints: BoxConstraints(minWidth: 0, minHeight: 0),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.blueGrey,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min, // Ensures the row only takes up as much space as needed
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                SizedBox(width: 8), // Adjust spacing between icon and text
                Text(
                  "Admin",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
