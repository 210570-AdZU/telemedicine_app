import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

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
          Text(
            "About Us",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "\nWelcome to Telemedicine, where we are pioneering a new era in healthcare accessibility across "
            "the Philippines. Conceived in 2022 in the bustling city of Zamboanga, Telemedicine is the brainchild "
            "of the dedicated team at Zamboanga City Medical Center. As physicians deeply rooted in our commitment "
            "to patient care, we recognized the pressing need to address the disparities in healthcare access that "
            "persist in our country.\n\nIn the Philippines, remote regions often struggle to access specialized "
            "medical expertise, leaving patients without the care they desperately need. At Telemedicine, we are "
            "driven by the belief that geography should never be a barrier to quality healthcare. That's why we've "
            "dedicated ourselves to harnessing the power of telemedicine to connect clinics, remote hospitals, and "
            "patients with a network of experienced specialists, regardless of their location.\n\nOur journey has "
            "been one of relentless dedication and unwavering commitment to our mission. Through strategic partnerships "
            "and tireless effort, Telemedicine has already made significant strides, onboarding a growing number of "
            "clinics and hospitals nationwide. Each new partnership brings us closer to our goal of ensuring that "
            "every Filipino has access to the specialized care they deserve.\n\nAs physicians, we understand the "
            "transformative potential of telemedicine to revolutionize the way healthcare is delivered. By embracing "
            "technology and collaboration, we are reshaping the healthcare landscape, one virtual consultation at a "
            "time.\n\nJoin us on this journey as we redefine healthcare access in the Philippines. Together, we can "
            "build a future where quality medical care knows no boundaries, and every patient receives the attention "
            "and expertise they need to thrive.\n\nTelemedicine - Empowering Healthcare, Transforming Lives.",
            style: TextStyle(
              fontSize: 12,
            ),
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}