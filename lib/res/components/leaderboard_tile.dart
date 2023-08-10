import 'package:flutter/material.dart';
import 'package:shoishob/res/colors.dart';

class LeaderboardTile extends StatelessWidget {
  const LeaderboardTile(
      {super.key, required this.rank, required this.name, required this.point});
  final String rank, name, point;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.05,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
        boxShadow: [
          BoxShadow(
            blurRadius: screenHeight * 0.01,
            spreadRadius: screenHeight * 0.001,
            color: AppColors.heading1.withOpacity(0.1),
            offset: Offset(
              0.0, // Move to right 7.0 horizontally
              screenHeight * 0.005, // Move to bottom 8.0 Vertically
            ),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.heading1,
            radius: screenWidth * 0.04,
            child: Text(
              rank,
              style: const TextStyle(color: Colors.white, fontFamily: "Roboto"),
            ),
          ),
          Text(name),
          CircleAvatar(
            backgroundColor: AppColors.subtitle1,
            radius: screenWidth * 0.04,
            child: Text(
              point,
              style: const TextStyle(color: Colors.white, fontFamily: "Roboto"),
            ),
          ),
        ],
      ),
    );
  }
}
