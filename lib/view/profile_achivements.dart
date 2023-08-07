import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../res/components/certifications.dart';
import '../res/components/medals.dart';

class ProfileAchivements extends StatefulWidget {
  const ProfileAchivements({super.key});

  @override
  State<ProfileAchivements> createState() => _ProfileAchivementsState();
}

class _ProfileAchivementsState extends State<ProfileAchivements> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.05,
        right: screenWidth * 0.05,
        bottom: screenHeight*0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeight * .15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(screenHeight * 0.03),
              boxShadow: [
                BoxShadow(
                  blurRadius: screenWidth * 0.02,
                  spreadRadius: screenWidth * 0.01,
                  color: Colors.grey,
                  offset: Offset(
                    0.0,
                    screenWidth * 0.01, // Move to bottom 8.0 Vertically
                  ),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.025),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: screenHeight * .023,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          radius: screenHeight * .02,
                          child: Text("2",
                              style: TextStyle(
                                  fontSize: screenHeight * 0.02,
                                  fontFamily: 'subtile',
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Level 2",
                              style: TextStyle(fontSize: screenHeight * 0.017)),
                          Text(
                            "500 points to next level",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: screenHeight * 0.015,
                                fontFamily: 'subtile',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                  LinearPercentIndicator(
                    progressColor: Colors.orange,
                    width: screenWidth * .65,
                    percent: .28,
                    leading: CircleAvatar(
                      radius: screenHeight * .023,
                      backgroundColor: Colors.deepOrangeAccent.withOpacity(0.5),
                      child: CircleAvatar(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.black,
                        radius: screenHeight * .02,
                        child: Text("2",
                            style: TextStyle(
                                fontSize: screenHeight * 0.02,
                                fontFamily: 'subtile',
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    trailing: CircleAvatar(
                      radius: screenHeight * .023,
                      backgroundColor: Colors.deepOrangeAccent.withOpacity(0.5),
                      child: CircleAvatar(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.black,
                        radius: screenHeight * .02,
                        child: Text("3",
                            style: TextStyle(
                                fontSize: screenHeight * 0.02,
                                fontFamily: 'subtile',
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    lineHeight: screenHeight * .03,
                    center: Text("5500/6000",
                        style: TextStyle(
                            fontSize: screenHeight * 0.016,
                            fontFamily: 'subtile',
                            fontWeight: FontWeight.bold)),
                    barRadius: Radius.circular(screenWidth * 0.5),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Row(
            children: [
              Text("MEDALS  ",
                  style: TextStyle(
                      fontSize: screenHeight * 0.016,
                      fontFamily: 'subtile',
                      fontWeight: FontWeight.bold)),
              Text("53",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenHeight * 0.016,
                      fontFamily: 'subtile',
                      fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Medals(text: "Gold", nmbr: "24", clr: Colors.orange),
                Medals(text: "Silver", nmbr: "18", clr: Colors.grey),
                Medals(text: "Bronze", nmbr: "11", clr: Colors.brown),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Row(
            children: [
              Text("CERTIFICATIONS  ",
                  style: TextStyle(
                      fontSize: screenHeight * 0.016,
                      fontFamily: 'subtile',
                      fontWeight: FontWeight.bold)),
              Text("8",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenHeight * 0.016,
                      fontFamily: 'subtile',
                      fontWeight: FontWeight.bold)),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Certifications(
                    text: "Sports Safety",
                    category: "Bronze Certified",
                    clr: Colors.brown),
                Certifications(
                    text: "Facilities ",
                    category: "Silver Certified",
                    clr: Colors.grey),
                Certifications(
                    text: "Security",
                    category: "Gold Certified",
                    clr: Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
