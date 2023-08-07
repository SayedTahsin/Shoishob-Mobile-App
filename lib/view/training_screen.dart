import 'package:flutter/material.dart';
import 'package:shoishob/view/workout_screen.dart';

import '../res/colors.dart';
import '../utils/routes/route_name.dart';

class TrainScreen extends StatefulWidget {
  const TrainScreen({super.key});

  @override
  State<TrainScreen> createState() => _TrainScreenState();
}

class _TrainScreenState extends State<TrainScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: screenHeight * 1.1,
        width: screenWidth * 1.1,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/image_8.png",
                    height: screenHeight * 0.4),
                Text(
                  "Safe Training\nand Meditation",
                  style: TextStyle(
                    fontSize: screenWidth * 0.11,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'Raleway',
                  ),
                ),
                Text(
                  "Make a workout Schedule Choose a coach and do one-to-one lessons, sports are much closer",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'Reemkufi',
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: screenHeight * .01),
                GestureDetector(
                  //Start Now button
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WorkScreen(),
                      ),
                    );
                    // Navigator.pushNamed(context, RouteName.workoutScreen);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(screenHeight * .025),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.all(Radius.circular(screenWidth * .1)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: screenWidth * 0.015,
                            spreadRadius: screenWidth * 0.005,
                            offset: Offset(
                              0.0, // Move to right 7.0 horizontally
                              screenWidth *
                                  0.01, // Move to bottom 8.0 Vertically
                            ),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * .01),
                        child: Center(
                          child: Text(
                            "Start Now",
                            style: TextStyle(
                              fontFamily: 'Reemkufi',
                              fontWeight: FontWeight.w400,
                              fontSize: screenWidth * 0.05,
                              color: AppColors.buttonTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
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
