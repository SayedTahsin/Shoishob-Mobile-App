import 'package:flutter/material.dart';

import '../colors.dart';

class BookingTile extends StatelessWidget {
  const BookingTile(
      {super.key,
      required this.turfName,
      required this.date,
      required this.slot,
      required this.paymentStatus});
  final String turfName, date, slot;
  final bool paymentStatus;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    String Status;
    if (paymentStatus == true) {
      Status = "PAID";
    } else {
      Status = "NOT PAID";
    }
    return Padding(
      padding: EdgeInsets.only(top: screenHeight * .01,left: screenWidth*0.02,right: screenHeight*0.02,),
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
                    date,
                    style: TextStyle(
                        fontFamily: 'subtile',
                        fontSize: screenWidth * 0.035,
                        color: AppColors.subtitle1,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    slot,
                    style: TextStyle(
                        fontFamily: 'subtile',
                        fontSize: screenWidth * 0.035,
                        color: AppColors.subtitle1,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              Text(
                Status,
                style: TextStyle(
                    fontFamily: 'subtile',
                    fontSize: screenWidth * 0.04,
                    color: Status == "PAID" ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
