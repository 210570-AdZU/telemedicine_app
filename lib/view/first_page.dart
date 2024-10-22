import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/controllers/first_page_controller.dart';
import 'package:layout_design/controllers/auth_controller.dart';

class FirstPage extends StatelessWidget {
  final FirstPageController controller = Get.put(FirstPageController());
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              'lib/assets/images/Removal-432.png',
              width: 33,
              height: 45,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TELEMEDICINE',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                  SizedBox(
                    height: 1,
                    width: 128,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black26,
                      ),
                    ),
                  ),
                Text(
                  ' Z.C Medical Center',
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
        actions: <Widget>[
          IconButton(
            iconSize: 26,
            icon: Stack(
              clipBehavior: Clip.none, 
              children: [
                Icon(
                  Icons.message_outlined,
                  color: Colors.grey.shade600,
                ),
                Positioned(
                  top: -4,
                  right: -12,
                  child: CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.blueGrey,
                    child: Text(
                      "2",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
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
            iconSize: 32,
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: Colors.grey.shade600,
                ),
                Positioned(
                  top: -1,
                  right: -9,
                  child: CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.orange,
                    child: Text(
                      "2",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
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
