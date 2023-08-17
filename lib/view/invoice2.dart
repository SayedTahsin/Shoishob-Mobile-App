import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../res/colors.dart';

class Invoice2 extends StatelessWidget {
  const Invoice2(
      {super.key,
      required this.transactionID,
      required this.turfName,
      required this.tournamentName,
      required this.captainName,
      required this.captainEmail,
      required this.phone});
  final String tournamentName,
      captainName,
      captainEmail,
      transactionID,
      phone,
      turfName;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: screenHeight * 0.02,
                right: screenHeight * 0.02,
                top: screenHeight * 0.05,
                bottom: screenHeight * 0.02,
              ),
              child: Container(
                height: screenHeight * 0.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.subtitle1.withOpacity(.8),
                    width: 10,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                      horizontal: screenWidth * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Text(
                          "Transaction ID",
                          style: TextStyle(
                            fontFamily: 'Reemkufi',
                            fontWeight: FontWeight.w400,
                            fontSize: screenWidth * 0.045,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        "$transactionID",
                        style: TextStyle(
                          fontFamily: 'Reemkufi',
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 0.045,
                          color: Colors.black,
                        ),
                      ),
                      const Divider(
                        height: 20,
                        thickness: 2,
                        color: AppColors.heading1,
                      ),
                      Text(
                        "Turf Name:   $tournamentName",
                        style: TextStyle(
                          fontFamily: 'Reemkufi',
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 0.045,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Turf Name:   $turfName",
                        style: TextStyle(
                          fontFamily: 'Reemkufi',
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 0.045,
                          color: Colors.black,
                        ),
                      ),
                      const Divider(
                        height: 20,
                        thickness: 2,
                        color: AppColors.heading1,
                      ),
                      Text(
                        "Captain Name :  $captainName",
                        style: TextStyle(
                          fontFamily: 'Reemkufi',
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 0.045,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Email:   $captainEmail",
                        style: TextStyle(
                          fontFamily: 'Reemkufi',
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 0.045,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Phone :  $phone",
                        style: TextStyle(
                          fontFamily: 'Reemkufi',
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 0.045,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            QrImageView(
              data:
                  "$transactionID\n$captainName\n$phone\n$turfName\n$captainEmail\n$tournamentName",
              version: QrVersions.auto,
              size: 200,
              gapless: true,
            ),
            SizedBox(height: screenHeight * 0.1),
          ],
        ),
      ),
    );
  }
}
