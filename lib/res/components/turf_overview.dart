import 'package:flutter/material.dart';
import 'package:shoishob/res/colors.dart';
import 'package:shoishob/services/UserInfoClass.dart';
import 'package:shoishob/services/session_manager.dart';
import 'package:shoishob/view/workout_screen.dart';

import '../../view/BookingScreen.dart';

class TurfOverview extends StatelessWidget {
  const TurfOverview({
    super.key,
    required this.pic,
    required this.name,
    required this.address,
    required this.price,
    required this.description,
    required this.rules,
  });
  final String pic, name, address, price, description, rules;
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
          child: Column(
            children: [
              Image.network(pic, fit: BoxFit.cover),
              Text(
                name,
                style: TextStyle(
                    fontSize: screenWidth * 0.09, fontFamily: "Raleway"),
              ),
              Text(
                address,
                style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.grey,
                    fontWeight: FontWeight.w900,
                    fontFamily: "subtile"),
              ),
              SizedBox(height: screenHeight * 0.01),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Text(
                  "About Us: $description",
                  style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontFamily: "subtile",
                      fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                "Pricing",
                style: TextStyle(
                    fontSize: screenWidth * 0.05, fontFamily: "Roboto"),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "$price Taka per Hour",
                style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    color: AppColors.subtitle1,
                    fontFamily: "Raleway"),
              ),
              SizedBox(height: screenHeight * 0.02),
              GestureDetector(
                //Start Now button

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingScreen(
                        name: name,
                        address: address,
                        price: price,
                        userEmail: SessionController().userEmail.toString(),
                        userName: SessionController().userName.toString(),
                      ),
                    ),
                  );
                  // Navigator.pushNamed(context, RouteName.workoutScreen);
                },
                child: Padding(
                  padding: EdgeInsets.all(screenHeight * .02),
                  child: Container(
                    width: screenWidth * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(screenHeight * 0.05)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: screenWidth * 0.015,
                          spreadRadius: screenWidth * 0.005,
                          offset: Offset(
                            0.0, // Move to right 7.0 horizontally
                            screenWidth * 0.01, // Move to bottom 8.0 Vertically
                          ),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * .01),
                      child: Center(
                        child: Text(
                          "Book Now",
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
              SizedBox(height: screenHeight * 0.01),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Text(
                  "Rules: $rules",
                  style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontFamily: "subtile",
                      fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
