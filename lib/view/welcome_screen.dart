import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoishob/res/colors.dart';
import 'package:shoishob/services/session_manager.dart';
import 'package:shoishob/utils/routes/route_name.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight * 1.1,
          width: screenWidth * 1.1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              //Main Column of the Screen
              children: [
                SizedBox(height: screenHeight * .05),
                Image(
                  //Shoishob welcome pic
                  height: screenHeight * 0.5,
                  image: const AssetImage('assets/images/ShoisobWelcome.png'),
                ),
                Container(
                  //Welcome Text
                  padding: EdgeInsets.only(left: screenWidth * .15),
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "welcome",
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: screenWidth * 0.1,
                      fontWeight: FontWeight.w700,
                      color: AppColors.heading1,
                    ),
                  ),
                ),
                Container(
                  //to the Shoishob Text
                  padding: EdgeInsets.only(left: screenWidth * .3),
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "to the Shoishob",
                    style: TextStyle(
                      fontFamily: 'subtile',
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.w700,
                      color: AppColors.subtitle1,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * .1),
                GestureDetector(
                  //Next Button
                  onTap: () {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    final user = auth.currentUser;
                    if (user == null) {
                      SessionController().userId = user?.uid.toString();
                      Navigator.pushNamed(context, RouteName.loginScreen);
                    } else
                      Navigator.pushNamed(context, RouteName.dashBoard);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.55),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.all(Radius.circular(screenWidth)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: screenWidth * 0.03,
                            spreadRadius: screenWidth * 0.003,
                            offset: Offset(
                              0.0, // Move to right 7.0 horizontally
                              screenWidth *
                                  0.015, // Move to bottom 8.0 Vertically
                            ),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * .1,
                            vertical: screenWidth * .02),
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontFamily: 'Reemkufi',
                            fontWeight: FontWeight.w400,
                            fontSize: screenWidth * 0.06,
                            color: AppColors.heading1,
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
