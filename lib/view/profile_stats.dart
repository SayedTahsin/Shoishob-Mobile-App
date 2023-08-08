import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../res/components/Tile1.dart';

class ProfileSTATS extends StatefulWidget {
  const ProfileSTATS({super.key});

  @override
  State<ProfileSTATS> createState() => _ProfileSTATSState();
}

class _ProfileSTATSState extends State<ProfileSTATS> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.04),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Tile1(
                    icn: Icons.electric_bolt,
                    points: 1055.toString(),
                    text: "Points"),
                Tile1(
                    icn: Icons.bar_chart_sharp,
                    points: "#2",
                    text: "Leaderboard"),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.04),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Tile1(
                    icn: Icons.incomplete_circle,
                    points: "33".toString() + "%",
                    text: "Improvement"),
                Tile1(
                    icn: Icons.timeline,
                    points: 26.toString() + "%",
                    text: "Screen Time"),
              ],
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        Padding(
          padding: EdgeInsets.only(left: screenWidth * .06),
          child: Text(
            "Level Up",
            style: TextStyle(
                color: Colors.grey,
                fontSize: screenHeight * 0.016,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .05),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(screenHeight * 0.03),
              boxShadow: [
                BoxShadow(
                  blurRadius: screenWidth * 0.02,
                  spreadRadius: screenWidth * 0.01,
                  color: Colors.grey,
                  offset: Offset(
                    0.0, // Move to right 7.0 horizontally
                    screenWidth * 0.01,
                  ),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        LinearPercentIndicator(
                          progressColor: Colors.blue,
                          width: screenWidth * .6,
                          leading: Image.asset('assets/images/Badminton.png',
                              height: screenHeight * 0.06),
                          trailing: Text("28%",
                              style: TextStyle(
                                  fontSize: screenHeight * 0.02,
                                  fontFamily: 'subtile')),
                          percent: .28,
                          lineHeight: screenHeight * .03,
                          center: Text("Badminton",
                              style: TextStyle(
                                  fontSize: screenHeight * 0.02,
                                  fontFamily: 'subtile',
                                  fontWeight: FontWeight.bold)),
                          barRadius: Radius.circular(screenHeight * 0.1),
                        ),
                        LinearPercentIndicator(
                          progressColor: Colors.blue,
                          width: screenWidth * .6,
                          leading: Image.asset('assets/images/Cricket.png',
                              height: screenHeight * 0.06),
                          trailing: Text("35%",
                              style: TextStyle(
                                  fontSize: screenHeight * 0.02,
                                  fontFamily: 'subtile')),
                          percent: .35,
                          lineHeight: screenHeight * .03,
                          center: Text("Cricket",
                              style: TextStyle(
                                  fontSize: screenHeight * 0.02,
                                  fontFamily: 'subtile',
                                  fontWeight: FontWeight.bold)),
                          barRadius: Radius.circular(screenHeight * 0.1),
                        ),
                        LinearPercentIndicator(
                          progressColor: Colors.blue,
                          width: screenWidth * .6,
                          leading: Image.asset('assets/images/Football.png',
                              height: screenHeight * 0.06),
                          trailing: Text("70%",
                              style: TextStyle(
                                  fontSize: screenHeight * 0.02,
                                  fontFamily: 'subtile')),
                          percent: .70,
                          lineHeight: screenHeight * .03,
                          center: Text("Football",
                              style: TextStyle(
                                  fontSize: screenHeight * 0.02,
                                  fontFamily: 'subtile',
                                  fontWeight: FontWeight.bold)),
                          barRadius: Radius.circular(screenHeight * 0.1),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
