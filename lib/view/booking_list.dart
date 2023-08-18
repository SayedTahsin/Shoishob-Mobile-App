import 'package:flutter/material.dart';
import 'package:shoishob/res/components/booking_list_tile.dart';
import 'package:shoishob/services/session_manager.dart';

import '../dbHelper/mongoDB.dart';

class BookingList extends StatefulWidget {
  const BookingList({super.key});

  @override
  State<BookingList> createState() => _BookingListState();
}

class _BookingListState extends State<BookingList> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(top: screenWidth * .06),
      child: FutureBuilder(
        future: MongoDatabase.getBookingInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: screenHeight * 0.4,
              width: screenWidth * 0.9,
              child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                // shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  if (snapshot.data![index]['email'] ==
                      SessionController().userEmail.toString()) {
                    return BookingTile(
                      price: snapshot.data![index]['price'].toString(),
                      transactionID: snapshot.data![index]['transactionId'],
                        phone: snapshot.data![index]['phone'],
                        turfName: snapshot.data![index]['turf'],
                        date: snapshot.data![index]['selectedDate'],
                        slot: snapshot.data![index]['slot'],
                        paymentStatus: snapshot.data![index]['paid']);
                  }else{
                    return Container();
                  }
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const Center(
                child: CircularProgressIndicator()); // Loading indicator
          }
        },
      ),
    );
  }
}
