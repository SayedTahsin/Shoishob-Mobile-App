import 'package:flutter/material.dart';

class Tile2 extends StatelessWidget {
  const Tile2(
      {super.key,
      required this.clr,
      required this.date,
      required this.text,
      required this.icn});
  final Color clr;
  final String date;
  final String text;
  final IconData icn;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.1, vertical: screenWidth * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenWidth),
              boxShadow: [
                BoxShadow(
                  blurRadius: screenWidth * 0.005,
                  spreadRadius: screenWidth * 0.005,
                  color: clr.withOpacity(.8),
                  offset: Offset(
                      0.0, // Move to right 7.0 horizontally
                      screenWidth * 0.001 // Move to bottom 8.0 Vertically
                      ),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: screenWidth * 0.05,
              backgroundColor: clr.withOpacity(.5),
              child: CircleAvatar(
                child: Icon(icn, size: screenHeight * 0.03),
                radius: screenWidth * 0.045,
                backgroundColor: clr,
              ),
            ),
          ),
          SizedBox(width: screenWidth * .05),
          Container(
            height: screenHeight * .07,
            width: screenWidth * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(text,
                      style: TextStyle(fontSize: screenHeight * 0.017)),
                ),
                Text(
                  date,
                  style: TextStyle(
                      color: Colors.grey, fontSize: screenHeight * 0.014),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
