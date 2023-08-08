import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shoishob/res/components/AppButton.dart';
import 'package:shoishob/view/dashboard.dart';

import '../res/colors.dart';

class Invoice extends StatelessWidget {
  const Invoice(
      {super.key,
      required this.transactionID,
      required this.userName,
      required this.phone,
      required this.slot,
      required this.date,
      required this.turfName});
  final String transactionID, userName, phone, slot, date, turfName;
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
                    color: AppColors.buttonColor,
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
                        "Name :  $userName",
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
                      const Divider(
                        height: 20,
                        thickness: 1,
                        indent: 0,
                        color: Colors.grey,
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
                      Text(
                        "Date:   $date",
                        style: TextStyle(
                          fontFamily: 'Reemkufi',
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 0.045,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Slot : $slot",
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
              data: "$transactionID\n$userName\n$phone\n$turfName\n$date\n$slot",
              version: QrVersions.auto,
              size: 200,
              gapless: true,
            ),
            SizedBox(height: screenHeight*0.1),
          ],
        ),
      ),
    );
  }
}
