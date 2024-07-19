import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

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
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            "Terms and Conditions\n",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "Patient Consent:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 0
            ),
          ),
          Text(
            "\nBefore initiating any case or accessing patient information, Telemedicine ensures that explicit consent is obtained from the patient. This consent is a prerequisite for any case processing and ensures that the patient is aware of and agrees to the use of their information for healthcare purposes.\n",
            style: TextStyle(
              fontSize: 12,
              height: 0
            ),
          ),
          Text(
            "Data Handling and Security:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 0
            ),
          ),
          Text(
            "\nTelemedicine is committed to ensuring the security and confidentiality of patient information. All patient data collected and stored by Telemedicine is handled securely and in compliance with applicable laws and regulations.\n\nWe employ industry-standard security measures to protect patient data from unauthorized access, disclosure, alteration, or destruction.\n",
            style: TextStyle(
              fontSize: 12,
              height: 0
            ),
          ),
          Text(
            "Use of Patient Data:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 0
            ),
          ),
          Text(
            "\nPatient data collected by Telemedicine is used solely for the purpose of processing cases and providing healthcare services. Under no circumstances will patient data be used for any other purpose without explicit consent.\n\nTelemedicine does not share patient data with any third parties except as required for case processing or as mandated by law.\n",
            style: TextStyle(
              fontSize: 12,
              height: 0
            ),
          ),
          Text(
            "Compliance:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 0
            ),
          ),
          Text(
            "\nTelemedicine is committed to complying with all applicable laws, regulations, and guidelines pertaining to the handling and processing of patient information.\n\nUsers of Telemedicine are expected to adhere to these Terms and all applicable laws and regulations.",
            style: TextStyle(
              fontSize: 12,
              height: 0
            ),
          ),
        ],
      ),
    );
  }
}