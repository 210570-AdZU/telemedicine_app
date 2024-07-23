import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/controllers/first_page_controller.dart';

class FirstPage extends StatelessWidget {
  // Create a controller to manage the state
  final FirstPageController controller = Get.put(FirstPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(width: 32, child: Image.asset('lib/assets/images/Removal-432.png')),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
              children: [
                Text(
                  'TELEMEDICINE',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  ' Z.C Medical Center',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            iconSize: 20, // Adjust iconSize as needed
            icon: Stack(
              clipBehavior: Clip.none, // Allow items to overflow outside Stack boundaries
              children: [
                Icon(Icons.message_outlined),
                Positioned(
                  top: -4, // Adjust top position to bring the CircleAvatar upward
                  right: -10, // Adjust right position to bring the CircleAvatar rightward
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.blueGrey,
                    child: Text(
                      "2",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              controller.showMessageNotifOverlay(context);
            },
          ),
          IconButton(
            iconSize: 28, // Adjust iconSize as needed
            icon: Stack(
              clipBehavior: Clip.none, // Allow items to overflow outside Stack boundaries
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: Colors.orange,
                ),
                Positioned(
                  top: 0, // Adjust top position to bring the CircleAvatar upward
                  right: -8, // Adjust right position to bring the CircleAvatar rightward
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.orange,
                    child: Text(
                      "2",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              controller.showNotifOverlay(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Get.toNamed('/menupage');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 12,),
          Obx(() => Container(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildNavItem(context, Icons.people, 'Doctor', 0),
                    buildNavItem(context, Icons.medication_outlined, 'Patient', 1),
                    buildNavItem(context, Icons.folder_copy_outlined, 'Archives', 2),
                  ],
                ),
              )),
          Expanded(
            child: Obx(() => controller.pages[controller.selectedIndex.value]),
          ),
        ],
      ),
    );
  }

  Widget buildNavItem(BuildContext context, IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => controller.navigateToPage(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: controller.selectedIndex.value == index ? Colors.blueGrey : Colors.black,
          ),
          Container(
            height: 2,
            width: MediaQuery.of(context).size.width / controller.pageNum.value,
            color: controller.selectedIndex.value == index ? Colors.blueGrey : Colors.transparent,
          ),
        ],
      ),
    );
  }
}

////////////////
///
// import 'package:flutter/material.dart';
// import 'package:layout_design/pages/archives.dart';
// import 'package:layout_design/pages/doctor_page.dart';
// import 'package:layout_design/pages/patient_page.dart';

// class FirstPage extends StatefulWidget {
//   const FirstPage({Key? key}) : super(key: key);

//   @override
//   State<FirstPage> createState() => _FirstPageState();
// }

// class _FirstPageState extends State<FirstPage> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     DoctorPage(),
//     PatientPage(),
//     Archives(), 
//   ];

//   void _navigateBottomBar(int index){
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Image.asset('lib/assets/images/Removal-432.png'),
//         title: Column(
//           children: [
//             Text('TELEMEDICINE', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
//             Text('ZC Medical Center', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),)
//           ],
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.message),
//             onPressed: (){
//               print("hmm");
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.notifications),
//             onPressed: (){print("uhh");
//             }
//           ),
//           IconButton(
//             icon: Icon(Icons.menu),
//             onPressed: (){print("woah");
//             }
//           ),
//         ],
//       ),
      
//       body: Column(
//         children: [
//           SizedBox(height: 12,),
//           BottomNavigationBar(
//             currentIndex: _selectedIndex,
//             onTap: _navigateBottomBar,
//             items: [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.people),
//                 label: 'Doctor',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Patient',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.folder),
//                 label: 'Archives',
//               ),
//             ],
//           ),
//           Expanded(
//             child: _pages[_selectedIndex], // Display the selected page
//           ),
//         ],
//       ),
//     );
//   }
// }
