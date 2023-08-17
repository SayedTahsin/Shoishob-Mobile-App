import 'package:flutter/material.dart';
import 'package:shoishob/res/components/Tournament_Tile.dart';

import '../dbHelper/mongoDB.dart';

class TournamentList extends StatelessWidget {
  const TournamentList({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tournaments"),
      ),
      body: Container(
        height: screenHeight * 1,
        width: screenWidth * 1.1,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
          future: MongoDatabase.getTournamentInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // print(snapshot.data!.length);
              return ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                // shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return TournamentTile(
                    logo: snapshot.data![index]['logo'],
                    city: snapshot.data![index]['city'],
                    about: snapshot.data![index]['about'],
                    address: snapshot.data![index]['address'],
                    cover: snapshot.data![index]['cover'],
                    email: snapshot.data![index]['email'],
                    ownerPhone: snapshot.data![index]['ownerPhone'],
                    person: snapshot.data![index]['person'].toString(),
                    price: snapshot.data![index]['price'].toString(),
                    reg_start: snapshot.data![index]['registration_start'],
                    reg_end: snapshot.data![index]['registration_end'],
                    rules: snapshot.data![index]['rules'],
                    tournament_name: snapshot.data![index]['tournament_name'],
                    turf_id: snapshot.data![index]['turf_id'],
                    turf_name: snapshot.data![index]['turf_name'],
                    id: snapshot.data![index]['_id'],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Center(
                  child: CircularProgressIndicator()); // Loading indicator
            }
          },
        ),
      ),
    );
  }
}
