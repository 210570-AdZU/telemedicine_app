import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/components/d_popBox.dart';
import 'package:layout_design/components/home_dropdownselect.dart';
import 'package:layout_design/components/my_searchbar.dart';
import 'package:layout_design/controllers/profile_list_controller.dart';
import '../components/addmin_button.dart';
class DoctorPage extends StatelessWidget {
  final ProfileListController profileListController = Get.put(ProfileListController());
  final TextEditingController searchController = TextEditingController();

  DoctorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    searchController.addListener(() {
      profileListController.filterProfiles(searchController.text);
    });

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      floatingActionButton: AddminButton(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                MySearchbar(searchController: searchController), // Pass the controller
                SizedBox(width: MediaQuery.of(context).size.width * 0.13,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: HomeDropdownselect(
                    selectList: ['All', 'Test', 'What'],
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.037,),
            Expanded(
              child: Obx(() => GridView.builder(
                itemCount: profileListController.filteredProfiles.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.712,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {
                  final profile = profileListController.filteredProfiles[index];
                  final hospital = profileListController.hospitals.firstWhere((h) => h.id == profile.hospitalId);
                  final specialization = profileListController.specializations.firstWhere((s) => s.id == profile.specializationId);
                  return DPopbox(
                    initialRingcolor: const Color.fromARGB(255, 225, 225, 225),
                    accountName: '${profile.fName} ${profile.mName} ${profile.lName}',
                    hospital: hospital.name,
                    specialization: specialization.name,
                    onPressed: () { profileListController.deleteProfile(profile.id!); },
                  );
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}

// FIRST

// import 'package:flutter/material.dart';
// import 'package:layout_design/components/d_popBox.dart';
// import 'package:layout_design/components/dropdownselect.dart';
// import 'package:layout_design/components/my_searchbar.dart';

// class DoctorPage extends StatelessWidget {
//   DoctorPage({super.key});

//   final int maxItemCount=3;
//   final List<String> dummyData = [
//     "Item 1",
//     "Item 2",
//     "Item 3",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 243, 243, 243),

//   floatingActionButton: FloatingActionButton.extended(
//     onPressed: () {},
//     label: Text("Admin"),
//     icon: Icon(Icons.add),
//     backgroundColor: Colors.teal,
//     hoverColor: Colors.lightGreen,
//     splashColor: Colors.yellow,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(12),
//     ),
//   ),

//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             // This widget will appear right below the AppBar
//             SizedBox(height: MediaQuery.of(context).size.width * 0.025,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 MySearchbar(),
        
//                 SizedBox(width: MediaQuery.of(context).size.width * 0.075,),
        
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.3,
//                   child: DropdownSelect(
//                     selectList: [
//                     '(None)',],
//                   )
//                 )
//               ],
//             ),
//             // List of items
//             SizedBox(height:MediaQuery.of(context).size.height * 0.025,),
//             Expanded(
//               child: GridView.builder(
//                 itemCount: dummyData.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 0.7125,
//                   mainAxisSpacing: 8.0,
//                   crossAxisSpacing: 8.0,
//                 ),
//                 itemBuilder: (context, index) {
//                   return DPopbox(
//                     // Pass data to DPopbox widget
//                     initialRingcolor: Colors.yellow,
//                     titleNum: dummyData[index],
//                     // You can pass additional parameters as needed
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }