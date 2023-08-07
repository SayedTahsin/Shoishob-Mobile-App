import 'package:flutter/material.dart';

class Medals extends StatelessWidget {
  const Medals({
    super.key,
    required this.clr,
    required this.nmbr,
    required this.text,
  });
  final Color clr;
  final String nmbr;
  final String text;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.025),
      child: Container(
        height: screenHeight * .15,
        width: screenWidth * 0.3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 0.05),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                color: clr,
                borderRadius: BorderRadius.circular(screenWidth * 0.05),
                boxShadow: [
                  BoxShadow(
                    blurRadius: screenWidth * 0.01,
                    spreadRadius: screenWidth * 0.005,
                    color: clr,
                    offset: Offset(
                      0.0, // Move to right 7.0 horizontally
                      screenWidth * 0.005, // Move to bottom 8.0 Vertically
                    ),
                  ),
                ],
              ),
              child: CircleAvatar(
                  radius: screenWidth * 0.05,
                  backgroundColor: clr.withOpacity(.5),
                  child: CircleAvatar(
                    radius: screenWidth * 0.045,
                    backgroundColor: clr,
                  )),
            ),
            Text(text, style: TextStyle(fontSize: screenHeight * 0.02)),
            Container(
                decoration: BoxDecoration(
                  color: clr.withOpacity(.5),
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.01),
                  child: Text(nmbr,
                      style: TextStyle(fontSize: screenHeight * 0.016)),
                )),
          ],
        ),
      ),
    );
  }
}
