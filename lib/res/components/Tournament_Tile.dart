import 'package:flutter/material.dart';

import '../colors.dart';

class TournamentTile extends StatelessWidget {
  const TournamentTile({
    super.key,
    required this.tournament_name,
    required this.turf_name,
    required this.email,
    required this.turf_id,
    required this.ownerPhone,
    required this.address,
    required this.city,
    required this.price,
    required this.person,
    required this.logo,
    required this.cover,
    required this.about,
    required this.rules,
    required this.reg_start,
    required this.reg_end,
  });
  final String tournament_name,
      turf_name,
      email,
      turf_id,
      ownerPhone,
      address,
      city,
      price,
      person,
      logo,
      cover,
      about,
      rules,
      reg_start,
      reg_end;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
      child: Container(
        height: screenHeight * 0.18,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 0.05),
          boxShadow: [
            BoxShadow(
              blurRadius: screenHeight * 0.01,
              spreadRadius: screenHeight * 0.001,
              color: AppColors.heading1.withOpacity(0.3),
              offset: Offset(
                0.0, // Move to right 7.0 horizontally
                screenHeight * 0.005, // Move to bottom 8.0 Vertically
              ),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.01),
              Center(
                  child: Text(
                tournament_name,
                style: TextStyle(
                    fontSize: screenWidth * 0.06, color: AppColors.subtitle1),
              )),
              Center(
                  child: Text(
                turf_name,
                style: TextStyle(
                    fontSize: screenWidth * 0.04, color: AppColors.heading1),
              )),
              SizedBox(height: screenHeight * 0.015),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Entry Fee : $price",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                Text(
                  "Team Size: $person",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              ]),
              const Center(
                  child: Text(
                "Registration",
                style: TextStyle(fontFamily: "Roboto"),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Starts: $reg_start",
                    style: TextStyle(fontSize: screenWidth * 0.04),
                  ),
                  Text(
                    "Ends: $reg_end",
                    style: TextStyle(fontSize: screenWidth * 0.04),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// tournament_name
// turf_name
// email
// turf_id
// ownerPhone
// address
// city
// price
// person
// logo
// cover
// about
// rules
// registration_start
// registration_end
