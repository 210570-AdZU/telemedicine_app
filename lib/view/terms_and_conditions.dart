import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

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
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SizedBox(height: 2,),
          Text(
            "Terms and Conditions",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 44,),
          Text(
            "Patient Consent:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 0
            ),
          ),
          SizedBox(height: 12,),
          Text(
            "Before initiating any case or accessing patient information, Telemedicine "
            "ensures that explicit consent is obtained from the patient. This consent is "
            "a prerequisite for any case processing and ensures that the patient is aware "
            "of and agrees to the use of their information for healthcare purposes.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade800,
              height: 0
            ),
          ),
          SizedBox(height: 24,),
          Text(
            "Data Handling and Security:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 0
            ),
          ),
          SizedBox(height: 12,),
          Text(
            "Telemedicine is committed to ensuring the security and confidentiality "
            "of patient information. All patient data collected and stored by "
            "Telemedicine is handled securely and in compliance with applicable laws "
            "and regulations.\n\nWe employ industry-standard security measures to "
            "protect patient data from unauthorized access, disclosure, alteration, or destruction.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade800,
              height: 0
            ),
          ),
          SizedBox(height: 24,),
          Text(
            "Use of Patient Data:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 0
            ),
          ),
          SizedBox(height: 12,),
          Text(
            "Patient data collected by Telemedicine is used solely for the purpose of processing "
            "cases and providing healthcare services. Under no circumstances will patient data be "
            "used for any other purpose without explicit consent.\n\nTelemedicine does not share patient "
            "data with any third parties except as required for case processing or as mandated by law.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade800,
              height: 0
            ),
          ),
          SizedBox(height: 24,),
          Text(
            "Compliance:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 0
            ),
          ),
          SizedBox(height: 12,),
          Text(
            "Telemedicine is committed to complying with all applicable laws, regulations, and "
            "guidelines pertaining to the handling and processing of patient information.\n\nUsers "
            "of Telemedicine are expected to adhere to these Terms and all applicable laws and regulations.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade800,
              height: 0
            ),
          ),
        ],
      ),
    );
  }
}