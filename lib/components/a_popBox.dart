import 'package:flutter/material.dart';

class APopbox extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const APopbox({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  State<APopbox> createState() => _APopboxState();
}

class _APopboxState extends State<APopbox> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Positioned widget for the top-left label
        Positioned(
          left: 16,
          top: -24,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Text(
              'A',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
        // Positioned widget for the top-right label
        Positioned(
          right: 16,
          top: -24,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Text(
              'June 10, 2024',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
        // Your existing APopbox widget
        InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(24), // This will match the Material's borderRadius
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(24),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.title,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.calendar_today),
                              SizedBox(width: 5),
                              Text("2 yrs"),
                              SizedBox(width: 25),
                              Icon(Icons.male, color: Colors.blue),
                              SizedBox(width: 5),
                              Text("Male"),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.medication, color: Colors.blueGrey),
                              SizedBox(width: 5),
                              Text("10101010101010"),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.chat, color: Colors.lightBlue),
                              SizedBox(width: 5),
                              Text(
                                "Chats",
                                style: TextStyle(
                                    fontSize: 16
                                ),
                              ),
                              SizedBox(width: 25),
                              Icon(Icons.phone, color: Colors.grey),
                              SizedBox(width: 5),
                              Text(
                                "Call",
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 120,
            right: 15,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text(
                  "TEST",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  )
              ),
            )
        ),
        Positioned(
            top: 10,
            right: 10,
            child: Icon(Icons.person, size: 40)
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';

// class APopbox extends StatefulWidget {
//   final String title;
//   const APopbox({Key? key, required this.title}) : super(key: key);

//   @override
//   State<APopbox> createState() => _APopboxState();
// }

// class _APopboxState extends State<APopbox> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         // Positioned widget for the top-left label
//         Positioned(
//           left: 16,
//           top: -24,
//           child: Container(
//             padding: EdgeInsets.symmetric(vertical: 4),
//             child: Text(
//               'A',
//               style: TextStyle(
//                 fontSize: 14,
//               ),
//             ),
//           ),
//         ),
//         // Positioned widget for the top-right label
//         Positioned(
//           right: 16,
//           top: -24,
//           child: Container(
//             padding: EdgeInsets.symmetric(vertical: 4),
//             child: Text(
//               'June 10, 2024',
//               style: TextStyle(
//                 fontSize: 14,
//               ),
//             ),
//           ),
//         ),
//         // Your existing APopbox widget
//         Material(
//           elevation: 2,
//           borderRadius: BorderRadius.circular(24),
//           child: Padding(
//             padding: const EdgeInsets.all(12),
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(widget.title,
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold
//                         ),),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Icon(Icons.calendar_today),
//                             SizedBox(width: 5),
//                             Text("2 yrs"),
//                             SizedBox(width: 25),
//                             Icon(Icons.male, color: Colors.blue),
//                             SizedBox(width: 5),
//                             Text("Male"),
//                           ],
//                         ),
//                         SizedBox(height: 10),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Icon(Icons.medication, color: Colors.blueGrey),
//                             SizedBox(width: 5),
//                             Text("10101010101010"),
//                           ],
//                         ),
//                         SizedBox(height: 20),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Icon(Icons.chat, color: Colors.lightBlue),
//                             SizedBox(width: 5),
//                             Text(
//                               "Chats",
//                               style: TextStyle(
//                                 fontSize: 16
//                               ),
//                               ),
//                             SizedBox(width: 25),
//                             Icon(Icons.phone, color: Colors.grey),
//                             SizedBox(width: 5),
//                             Text(
//                               "Call",
//                               style: TextStyle(
//                                 fontSize: 16
//                               ),
//                               ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 120,
//           right: 15,
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.grey,
//             ),
//             child: Text(
//               "TEST",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold
//               )
//             ),
//           )
//         ),
//         Positioned(
//           top: 10,
//           right: 10,
//           child: Icon(Icons.person, size: 40)
//         ),
//       ],
//     );
//   }
// }
