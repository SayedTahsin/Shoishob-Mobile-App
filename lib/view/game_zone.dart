import 'package:flutter/material.dart';
import 'package:shoishob/res/colors.dart';
import '../dbHelper/mongoDB.dart';
import '../res/components/turfTile.dart';

class GameZone extends StatefulWidget {
  const GameZone({super.key});

  @override
  State<GameZone> createState() => _GameZoneState();
}

class _GameZoneState extends State<GameZone> {
  final zoneController = TextEditingController();
  final zoneFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: screenHeight * 1.1,
        width: screenWidth * 1.1,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * .06,
                right: screenWidth * .06,
                top: screenHeight * .01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Game Zone",
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth * 0.1,
                      color: AppColors.heading1),
                ),
                Text(
                  "Find your favourite zone",
                  style: TextStyle(
                    fontFamily: 'subtile',
                    fontWeight: FontWeight.w200,
                    fontSize: screenWidth * 0.05,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenWidth * .06),
                  child: FutureBuilder(
                    future: MongoDatabase.getTurfInfo(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        // print(snapshot.data!.length);
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return TurfTile(
                              turfName:
                                  snapshot.data![index]['turf_name'].toString(),
                              address:
                                  snapshot.data![index]['address'].toString(),
                              about: snapshot.data![index]['about'].toString(),
                              rules: snapshot.data![index]['rules'].toString(),
                              logo: snapshot.data![index]['logo'].toString(),
                              cover: snapshot.data![index]['cover'].toString(),
                              price: snapshot.data![index]['price'].toString(),
                              phone: snapshot.data![index]['ownerPhone']
                                  .toString(),
                              city: snapshot.data![index]['city'].toString(),
                              ownerId:
                                  snapshot.data![index]['ownerId'].toString(),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return const Center(child: CircularProgressIndicator()); // Loading indicator
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
