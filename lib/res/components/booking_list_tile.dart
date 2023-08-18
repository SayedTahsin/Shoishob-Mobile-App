import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:shoishob/services/session_manager.dart';
import 'package:uuid/uuid.dart';

import '../../dbHelper/constants.dart';
import '../../dbHelper/mongoDB.dart';
import '../../utils/utils.dart';
import '../../view/Invoice.dart';
import '../colors.dart';

class BookingTile extends StatefulWidget {
  BookingTile(
      {super.key,
      required this.turfName,
      required this.date,
      required this.slot,
      required this.paymentStatus,
      required this.phone,
      required this.transactionID,
      required this.price});
  final String turfName, date, slot, phone, transactionID, price;
  final bool paymentStatus;

  @override
  State<BookingTile> createState() => _BookingTileState();
}

class _BookingTileState extends State<BookingTile> {
  var uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String Status;
    if (widget.paymentStatus == true) {
      Status = "PAID";
    } else {
      Status = "NOT PAID";
    }
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * .01,
        left: screenWidth * 0.02,
        right: screenHeight * 0.02,
      ),
      child: GestureDetector(
        onTap: () {
          if (widget.paymentStatus == true) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Invoice(
                        phone: widget.phone,
                        transactionID: widget.transactionID,
                        turfName: widget.turfName,
                        userName: SessionController().userName.toString(),
                        date: widget.date,
                        slot: widget.slot,
                      )),
            );
          } else {
            sslCommerzGeneralCall();
            setState(() {});
          }
        },
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
                      widget.turfName,
                      style: TextStyle(
                        fontFamily: 'raleway',
                        fontSize: screenWidth * 0.05,
                        color: AppColors.heading1,
                      ),
                    ),
                    Text(
                      widget.date,
                      style: TextStyle(
                          fontFamily: 'subtile',
                          fontSize: screenWidth * 0.035,
                          color: AppColors.subtitle1,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      widget.slot,
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
      ),
    );
  }

  Future<void> sslCommerzGeneralCall() async {
    String transactionId = uuid.v1();
    Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        //Use the ipn if you have valid one, or it will fail the transaction.
        ipn_url: "www.ipnurl.com",
        multi_card_name: "visa,master,bkash",
        currency: SSLCurrencyType.BDT,
        product_category: "Booking",
        sdkType: SSLCSdkType.TESTBOX,
        store_id: STOREID,
        store_passwd: STOREPASS,
        total_amount: double.parse(widget.price),
        tran_id: transactionId,
      ),
    );

    try {
      SSLCTransactionInfoModel result = await sslcommerz.payNow();
      print(result.status!.toLowerCase());
      if (result.status!.toLowerCase() == "failed") {
        Utils.toastMessage("Transaction Failed");
      } else if (result.status!.toLowerCase() == "closed") {
        Utils.toastMessage("Payment not Complete");
      } else {
        MongoDatabase().updateTransaction(
            SessionController().userEmail.toString(),
            widget.date,
            widget.slot,
            transactionId);

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Invoice(
                    date: widget.date,
                    phone: widget.phone,
                    slot: widget.slot,
                    transactionID: transactionId,
                    turfName: widget.turfName,
                    userName: SessionController().userName.toString(),
                  )),
        );

        Utils.toastMessage(
            "Transaction is Successful and Amount is ${result.amount}");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
