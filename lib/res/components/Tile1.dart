import 'package:flutter/material.dart';

class Tile1 extends StatelessWidget {
  const Tile1(
      {super.key, required this.icn, required this.points, required this.text});
  final IconData icn;
  final String points;
  final String text;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.02),
      child: Container(
        height: screenHeight * .1,
        width: screenWidth * 0.43,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenHeight * 0.02),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              child: Icon(icn),
              radius: screenHeight * 0.025,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  points,
                  style: TextStyle(
                      fontSize: screenHeight * 0.02,
                      fontFamily: 'subtile',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  text,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenHeight * 0.015,
                      fontFamily: 'subtile',
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
