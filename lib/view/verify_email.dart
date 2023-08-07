import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoishob/view/dashboard.dart';

import '../res/colors.dart';
import '../res/components/AppButton.dart';
import '../view_model/authentication/auth.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({super.key});

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  bool isEmailVerified = false;
  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      Auth().sendEmailVerification();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return isEmailVerified
        ? DashboardScreen()
        : Scaffold(
            appBar: AppBar(
              title: const Text("Verify Email"),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "A verification mail has been sent",
                    style: TextStyle(
                      fontFamily: 'subtile',
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.w700,
                      color: AppColors.subtitle1,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                AppButton(
                    title: "Resent Email",
                    onPress: () {
                      Auth().sendEmailVerification();
                    }),
              ],
            ),
          );
  }
}
