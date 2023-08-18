import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shoishob/res/colors.dart';
import 'package:shoishob/res/components/AppContainer.dart';
import 'package:shoishob/services/session_manager.dart';
import 'package:shoishob/view/leaderboard.dart';
import 'package:shoishob/view/profile_screen.dart';
import 'package:shoishob/view/tournametList.dart';
import 'package:shoishob/view/training_screen.dart';
import 'package:shoishob/view/transportation.dart';

import '../services/UserInfoClass.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final findController = TextEditingController();
  final findFocusNode = FocusNode();

  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      setState(() {}
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome to Shoishob",
          style: TextStyle(fontFamily: 'Raleway', fontSize: screenWidth * 0.06),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * .03),
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage(SessionController().userPhotoUrl.toString()),
                radius: screenHeight * 0.03,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          //Background Image
          height: screenHeight * 1,
          width: screenWidth * 1.1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            //Main Column
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * .015),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
                child: Container(
                  //find places container
                  height: screenHeight * .25,
                  decoration: BoxDecoration(
                    color: AppColors.container,
                    borderRadius: BorderRadius.circular(screenWidth * 0.1),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\n\n Empowering\n Active PLAY ",
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: screenWidth * 0.06,
                            color: Colors.white,
                          ),
                        ),
                        // SizedBox(width: screenWidth * 0.1),
                        Image.asset("assets/images/Saly-19.png",
                            height: screenHeight * 0.25),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TournamentList(),
                        ),
                      );
                    },
                    child: AppContainer(
                      ht: screenHeight * 0.22,
                      wt: screenWidth * 0.42,
                      icn: Icons.sports_cricket_outlined,
                      rating: "4.9",
                      review: "2462",
                      text: "Tournaments",
                      clr: Colors.purpleAccent,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrainScreen(),
                        ),
                      );
                    },
                    child: AppContainer(
                      ht: screenHeight * 0.22,
                      wt: screenWidth * 0.42,
                      icn: Icons.favorite_outline_rounded,
                      rating: "4.4",
                      review: "467",
                      text: "Health",
                      clr: Colors.deepOrangeAccent,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Transport(),
                        ),
                      );
                    },
                    child: AppContainer(
                      ht: screenHeight * 0.22,
                      wt: screenWidth * 0.42,
                      icn: Icons.emoji_transportation_outlined,
                      rating: "4.5",
                      review: "234",
                      text: "Transportation",
                      clr: Colors.lightGreen,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Leaderboard(),
                        ),
                      );
                    },
                    child: AppContainer(
                      ht: screenHeight * 0.22,
                      wt: screenWidth * 0.42,
                      icn: Icons.bar_chart_outlined,
                      rating: "4.8",
                      review: "62",
                      text: "Leaderboard",
                      clr: Colors.blue,
                    ),
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
