import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shoishob/dbHelper/databaseModels/user_model.dart';
import 'package:shoishob/dbHelper/mongoDB.dart';
import 'package:shoishob/res/components/leaderboard_tile.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  List<Map<dynamic, dynamic>> users = [];
  bool isLoading = true;
  @override
  void initState() {
    loadUserData();
    super.initState();
  }

  Future<void> loadUserData() async {
    try {
      var data = await MongoDatabase.getUserData();
      setState(() {
        for (Map i in data) {
          users.add(i);
        }
        users.sort((a, b) => b['point'].compareTo(a['point']));
        isLoading = false; // Set loading state to false
      });
    } catch (error) {
      print("Error loading user data: $error");
      isLoading = false; // Set loading state to false even in case of error
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Leaderboard"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                height: screenHeight * 1,
                width: screenWidth * 1.1,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Rank"),
                          Text("Name"),
                          Text("Points"),
                        ],
                      ),
                      Divider(
                          height: screenHeight * 0.03,
                          thickness: 1.5,
                          color: Colors.black),
                      SizedBox(
                        height: screenHeight * 0.75,
                        width: screenWidth * 0.9,
                        child: ListView.builder(
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              print(users[index]['name']);
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.02,
                                    vertical: screenWidth * 0.01),
                                child: LeaderboardTile(
                                    rank: (index + 1).toString(),
                                    name: users[index]['name'].toString(),
                                    point: users[index]['point'].toString()),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
