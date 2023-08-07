import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shoishob/services/session_manager.dart';

class HaelthTracker extends StatefulWidget {
  const HaelthTracker({super.key});

  @override
  State<HaelthTracker> createState() => _HaelthTrackerState();
}

class _HaelthTrackerState extends State<HaelthTracker> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Health tracker",
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: screenWidth * 0.05,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          //background image;
          height: screenHeight * 1.1,
          width: screenWidth * 1.1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * .05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        SessionController().userPhotoUrl.toString()),
                    radius: screenWidth * 0.2,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Center(
                  child: Text(
                    "Sayed Tahsin",
                    style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontFamily: 'subtile',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: screenWidth * 0.02,
                        spreadRadius: screenWidth * 0.01,
                        color: Colors.grey,
                        offset: Offset(
                          0.0, // Move to right 7.0 horizontally
                          screenWidth * 0.01, // Move to bottom 8.0 Vertically
                        ),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/sleep.png',
                        height: screenHeight * .1,
                      ),
                      Column(
                        children: [
                          Text(
                            "Sleep",
                            style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                fontFamily: 'raleway'),
                          ),
                          Text(
                            "9H 08M",
                            style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                fontFamily: 'subtile'),
                          ),
                          Text(
                            "of 8H Sleep",
                            style: TextStyle(
                                fontSize: screenWidth * 0.03,
                                color: Colors.grey,
                                fontFamily: 'subtile',
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * .05),
                        child: Image.asset(
                          'assets/images/Group.png',
                          height: screenWidth * 0.1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * .03),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
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
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/health.png',
                        height: screenHeight * .1,
                      ),
                      Column(
                        children: [
                          Text(
                            "Blood Pressure (bpm)",
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontFamily: 'raleway',
                            ),
                          ),
                          Text(
                            "130/90",
                            style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              fontFamily: 'subtile',
                            ),
                          ),
                          Text(
                            "15 mint ago",
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              color: Colors.grey,
                              fontFamily: 'subtile',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * .05),
                        child: Image.asset(
                          'assets/images/Heart.png',
                          height: screenWidth * 0.12,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
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
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Mood",
                                style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    color: Colors.grey,
                                    fontFamily: 'raleway',
                                    fontWeight: FontWeight.bold)),
                            Text(
                              "Feeling\nGood",
                              style: TextStyle(
                                  fontSize: screenWidth * 0.045,
                                  fontFamily: 'raleway',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        child: Image.asset(
                          "assets/images/Vector_8.png",
                          height: screenHeight * .08,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Screen Time Monitoring",
                  style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.grey,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
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
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(screenWidth * .03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "100 Min",
                              style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  color: Colors.black,
                                  fontFamily: 'raleway',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Average today",
                              style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  color: Colors.grey,
                                  fontFamily: 'subtile',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * .02),
                        child: Image.asset(
                          "assets/images/Vector_8.png",
                          height: screenHeight * .06,
                        ),
                      ),
                    ],
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
