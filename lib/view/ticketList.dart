import 'package:flutter/material.dart';
import 'package:shoishob/res/components/ticket_list_tile.dart';

import '../dbHelper/mongoDB.dart';
import '../res/components/booking_list_tile.dart';
import '../services/session_manager.dart';

class TicketList extends StatefulWidget {
  const TicketList({super.key});

  @override
  State<TicketList> createState() => _TicketListState();
}

class _TicketListState extends State<TicketList> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(top: screenWidth * .06),
      child: FutureBuilder(
        future: MongoDatabase.getTicketInfo(),
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
                    return TicketTile(
                        ticketNo: snapshot.data![index]['ticketNo'],
                        date: snapshot.data![index]['date'],
                        from: snapshot.data![index]['pickup'],
                        to: snapshot.data![index]['destination']);
                  } else {
                    return Container();
                  }
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Center(
                child: CircularProgressIndicator()); // Loading indicator
          }
        },
      ),
    );
  }
}
