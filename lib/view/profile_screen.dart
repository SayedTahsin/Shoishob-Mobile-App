import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoishob/res/colors.dart';
import 'package:shoishob/services/session_manager.dart';
import 'package:shoishob/view/login_screen.dart';
import 'package:shoishob/view/profile_achivements.dart';
import 'package:shoishob/view/profile_activity.dart';
import 'package:shoishob/view/profile_stats.dart';

import '../main.dart';
import '../res/components/AppButton.dart';
import '../utils/utils.dart';
import '../view_model/authentication/auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int opt = 0;

  Future<void> signOut() async {
    try {
      await Auth().signOut().then((value) {
        Utils.toastMessage("Logged out");
        RestartWidget.restartApp(context);
      });
    } on FirebaseAuthException catch (e) {
      Utils.toastMessage(e.message.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight * 1.1,
          width: screenWidth * 1.1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/background.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: screenWidth * 0.2,
                  backgroundImage:
                      NetworkImage(SessionController().userPhotoUrl.toString()),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Center(
                child: Text(
                  SessionController().userName.toString(),
                  style: TextStyle(
                    color: AppColors.heading1,
                    fontSize: screenWidth * 0.06,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Center(
                child: Text(
                  SessionController().userEmail.toString(),
                  style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      color: AppColors.subtitle1,
                      fontFamily: 'subtile',
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      opt = 0;
                      setState(() {
                        // print(opt);
                      });
                    },
                    child: Text(
                      "STATS",
                      style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: AppColors.buttonColor,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      opt = 1;
                      setState(() {
                        // print(opt);
                      });
                    },
                    child: Text(
                      "ACHIVEMENTS",
                      style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: AppColors.buttonColor,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      opt = 2;
                      setState(() {
                        // print(opt);
                      });
                    },
                    child: Text(
                      "ACTIVITY",
                      style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: AppColors.buttonColor,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              if (opt == 0) ...[
                ProfileSTATS(),
              ] else if (opt == 1) ...[
                ProfileAchivements(),
              ] else ...[
                Activity(),
              ],
              Container(
                child: AppButton(
                    title: "Log Out",
                    onPress: () {
                      signOut();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
