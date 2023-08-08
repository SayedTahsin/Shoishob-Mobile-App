import 'dart:math';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shoishob/dbHelper/mongoDB.dart';
import 'package:shoishob/res/components/AppButton.dart';
import 'package:shoishob/services/session_manager.dart';

import '../res/colors.dart';
import '../utils/utils.dart';

class Ticket extends StatefulWidget {
  Ticket({
    super.key,
    required this.name,
    required this.phone,
    required this.from,
    required this.destination,
    required this.date,
  });

  String name, phone, from, destination;
  DateTime date;

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890#';

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(
        Iterable.generate(
          length,
          (_) => Ticket._chars.codeUnitAt(_rnd.nextInt(Ticket._chars.length)),
        ),
      );

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String weekDay;
    if (widget.date.weekday == 1) {
      weekDay = "Monday";
    } else if (widget.date.weekday == 2) {
      weekDay = "Tuesday";
    } else if (widget.date.weekday == 3) {
      weekDay = "Wednesday";
    } else if (widget.date.weekday == 4) {
      weekDay = "Thursday";
    } else if (widget.date.weekday == 5) {
      weekDay = "Friday";
    } else if (widget.date.weekday == 6) {
      weekDay = "Saturday";
    } else {
      weekDay = "Sunday";
    }
    String ticketID = getRandomString(12);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ticket",
          style: TextStyle(
            fontSize: screenHeight * .04,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenHeight * 0.02,
                  vertical: screenHeight * 0.05),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          QrImageView(
                            data:
                                "$ticketID\n${widget.name}\n${widget.phone}\n${widget.date}\n${widget.from}\n${widget.destination}",
                            version: QrVersions.auto,
                            size: 100,
                            gapless: true,
                          ),
                          Text(
                            "Ticket No : $ticketID",
                            style: TextStyle(
                              fontFamily: 'Reemkufi',
                              fontWeight: FontWeight.w400,
                              fontSize: screenWidth * 0.045,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 20,
                        thickness: 2,
                        color: AppColors.heading1,
                      ),
                      Text(
                        "Name :  ${widget.name}",
                        style: TextStyle(
                          fontFamily: 'Reemkufi',
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 0.045,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Phone :  ${widget.phone}",
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
                        "Pickup :   ${widget.from}",
                        style: TextStyle(
                          fontFamily: 'Reemkufi',
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 0.045,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Destination :   ${widget.destination}",
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
                        color: Colors.grey,
                      ),
                      Text(
                        "Date of travel : ${widget.date.day}-${widget.date.month}-${widget.date.year} [$weekDay]",
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
            AppButton(
                title: "Confirm",
                onPress: () {
                  MongoDatabase().insertTicketsData(
                      widget.name,
                      "${widget.date.day}-${widget.date.month}-${widget.date.year} [$weekDay]",
                      widget.phone,
                      widget.from,
                      widget.destination,
                      ticketID,
                      SessionController().userEmail.toString());
                }),
          ],
        ),
      ),
    );
  }
}
