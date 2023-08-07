import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:shoishob/dbHelper/databaseModels/turf_info.dart';
import 'package:shoishob/res/colors.dart';
import 'package:shoishob/res/components/turf_overview.dart';

class TurfTile extends StatelessWidget {
  const TurfTile({
    super.key,
    required this.turfName,
    required this.address,
    required this.about,
    required this.rules,
    required this.logo,
    required this.cover,
    required this.price,
    required this.phone,
    required this.city,
  });
  final turfName, address, about, rules, logo, cover, price, phone, city;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => new TurfOverview(
              name: turfName,
              address: "$address, $city",
              pic: cover,
              price: price,
              description: about,
              rules: rules,
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: screenHeight * .02),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(screenHeight * 0.02),
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
          child: Padding(
            padding: EdgeInsets.all(screenHeight * .02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      turfName,
                      style: TextStyle(
                        fontFamily: 'raleway',
                        fontSize: screenWidth * 0.05,
                        color: AppColors.heading1,
                      ),
                    ),
                    Text(
                      "$address, $city",
                      style: TextStyle(
                          fontFamily: 'subtile',
                          fontSize: screenWidth * 0.035,
                          color: AppColors.subtitle1,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: screenWidth * 0.1,
                      backgroundImage: NetworkImage(logo),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
