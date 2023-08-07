import 'package:flutter/material.dart';
import 'package:shoishob/res/colors.dart';

class AppContainer extends StatelessWidget {
  final ht, wt;
  final IconData icn;
  final String text, rating, review;
  final Color clr;
  const AppContainer({
    super.key,
    required this.ht,
    required this.wt,
    required this.icn,
    required this.review,
    required this.text,
    required this.rating,
    required this.clr,
  });
  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.all(screenWidth*0.03),
      child: Container(
        height: ht,
        width: wt,
        decoration: BoxDecoration(
          color: clr,
          borderRadius: BorderRadius.circular(screenWidth*0.07),
          boxShadow: [
            BoxShadow(
              blurRadius: screenHeight*0.02,
              spreadRadius: screenHeight*0.001,
              color: clr,
              offset: Offset(
                0.0, // Move to right 7.0 horizontally
                screenWidth*0.01, // Move to bottom 8.0 Vertically
              ),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth*0.03),
              child: Icon(
                icn,
                size: screenHeight*0.045,
                color: Colors.white,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: screenWidth*0.05,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                SizedBox(width: screenWidth*0.005),
                Text(
                  rating,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: screenWidth*0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Text(
              "$review Reviews",
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: screenWidth*0.05,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
