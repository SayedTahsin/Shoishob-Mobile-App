import 'package:flutter/material.dart';
import 'package:shoishob/res/colors.dart';
import 'package:shoishob/res/components/AppContainer.dart';
import 'package:shoishob/services/session_manager.dart';
import 'package:shoishob/view/profile_screen.dart';
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
    UserInfoClass();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shoishob",
          style: TextStyle(fontFamily: 'Raleway', fontSize: screenWidth * 0.06),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * .02),
              child: CircleAvatar(
                backgroundImage: NetworkImage(SessionController().userPhotoUrl.toString(), scale: 1.0),
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
                padding: EdgeInsets.symmetric(horizontal: screenWidth * .02),
                child: Container(
                  //find places container
                  height: screenHeight * .36,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.container,
                    borderRadius: BorderRadius.circular(screenWidth * 0.1),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            //Find place text
                            padding: EdgeInsets.only(
                                top: screenHeight * 0.15,
                                left: screenWidth * .06),
                            child: Text(
                              "Find\nPlaces",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: screenWidth * 0.08,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.17),
                          Image.asset("assets/images/Saly-19.png",
                              height: screenHeight * 0.25),
                        ],
                      ),
                      Padding(
                        //Text field find places
                        padding: EdgeInsets.all(screenWidth * 0.03),
                        child: TextFormField(
                          enabled: true,
                          controller: findController,
                          focusNode: findFocusNode,
                          obscureText: false,
                          onFieldSubmitted: (value) {},
                          validator: (value) {},
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  height: .5,
                                  fontSize: screenWidth * 0.05,
                                  fontFamily: 'Reemkufi'),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenWidth * 0.1)),
                            ),
                            filled: true, //<-- SEE HERE
                            fillColor: Colors.white, //<--
                            hintText: "what you want to find?",
                            enabled: false,
                            contentPadding: EdgeInsets.all(screenWidth * 0.03),
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    height: 0,
                                    color: Colors.grey.withOpacity(0.7),
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'subtile'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppContainer(
                    ht: screenHeight * 0.2,
                    wt: screenWidth * 0.4,
                    icn: Icons.sports_cricket_outlined,
                    rating: "4.9",
                    review: "2462",
                    text: "Sports",
                    clr: Colors.purpleAccent,
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
                      ht: screenHeight * 0.2,
                      wt: screenWidth * 0.4,
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
                      ht: screenHeight * 0.2,
                      wt: screenWidth * 0.4,
                      icn: Icons.emoji_transportation_outlined,
                      rating: "4.5",
                      review: "234",
                      text: "Transportation",
                      clr: Colors.lightGreen,
                    ),
                  ),
                  AppContainer(
                    ht: screenHeight * 0.2,
                    wt: screenWidth * 0.4,
                    icn: Icons.bar_chart_outlined,
                    rating: "4.8",
                    review: "62",
                    text: "Ranking",
                    clr: Colors.blue,
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
