import 'package:flutter/material.dart';

class Certifications extends StatelessWidget {
  const Certifications({
    super.key,
    required this.clr,
    required this.category,
    required this.text,
  });
  final Color clr;
  final String category;
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
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: clr,
                borderRadius: BorderRadius.circular(screenWidth * 0.1),
                boxShadow: [
                  BoxShadow(
                    blurRadius: screenWidth * 0.01,
                    spreadRadius: screenWidth * 0.005,
                    color: clr,
                    offset: Offset(
                      0.0, // Move to right 7.0 horizontally
                      screenWidth * 0.002, // Move to bottom 8.0 Vertically
                    ),
                  ),
                ],
              ),
              child: CircleAvatar(
                  radius: screenWidth * 0.05,
                  backgroundColor: clr.withOpacity(.5),
                  child: CircleAvatar(
                    child: Icon(
                      Icons.done_outline,
                      size: screenHeight * 0.03,
                    ),
                    radius: screenWidth * 0.045,
                    backgroundColor: clr,
                  )),
            ),
            Center(
                child: Text(text,
                    style: TextStyle(fontSize: screenHeight * 0.016))),
            Container(
                decoration: BoxDecoration(
                  color: clr.withOpacity(.5),
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.01),
                  child: Text(category,
                      style: TextStyle(fontSize: screenHeight * 0.015)),
                )),
          ],
        ),
      ),
    );
  }
}
