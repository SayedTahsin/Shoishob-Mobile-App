import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
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
    required this.ownerId,
    required this.logo,
  });
  final String pic, name, address, price, description, rules, ownerId, logo;
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
                child: ReadMoreText(
                  "About us:  $description",
                  trimLines: 3,
                  colorClickableText: Colors.purple,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '\nShow more',
                  trimExpandedText: '\nShow less',
                  moreStyle: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                  lessStyle: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
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
                        logo: logo,
                        ownerId: ownerId,
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
              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: ReadMoreText(
                  "Rules:   $rules",
                  trimLines: 3,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '\t\tShow more',
                  trimExpandedText: '\t\tShow less',
                  moreStyle: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                  lessStyle: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              SizedBox(height: screenHeight * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
