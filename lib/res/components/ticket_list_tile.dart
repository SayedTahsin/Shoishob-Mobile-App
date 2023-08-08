import 'package:flutter/material.dart';

import '../colors.dart';

class TicketTile extends StatelessWidget {
  const TicketTile(
      {super.key,
      required this.ticketNo,
      required this.date,
      required this.from,
      required this.to});
  final String ticketNo, date, from, to;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * .01,
        left: screenWidth * 0.02,
        right: screenHeight * 0.02,
      ),
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
                    "Ticket No : $ticketNo",
                    style: TextStyle(
                      fontFamily: 'raleway',
                      fontSize: screenWidth * 0.05,
                      color: AppColors.heading1,
                    ),
                  ),
                  Text(
                    'Date : $date',
                    style: TextStyle(
                        fontFamily: 'subtile',
                        fontSize: screenWidth * 0.035,
                        color: AppColors.subtitle1,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "$from to $to",
                    style: TextStyle(
                        fontFamily: 'subtile',
                        fontSize: screenWidth * 0.035,
                        color: AppColors.subtitle1,
                        fontWeight: FontWeight.w900),
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
