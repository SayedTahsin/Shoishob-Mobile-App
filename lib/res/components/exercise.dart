import 'package:flutter/material.dart';
import 'package:shoishob/res/components/stopwatch.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExerciseOverview extends StatefulWidget {
  ExerciseOverview({
    super.key,
    required this.videoLink,
    required this.exerciseName,
    required this.mint,
    required this.difficulty,
    required this.cat,
    required this.description,
  });
  final String videoLink, exerciseName, mint, difficulty, cat, description;

  @override
  State<ExerciseOverview> createState() => _ExerciseOverviewState();
}

class _ExerciseOverviewState extends State<ExerciseOverview> {
  YoutubePlayerController? _controller;
  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(widget.videoLink);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          disableDragSeek: true,
          loop: false,
          enableCaption: false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight * 1.1,
          width: screenWidth * 1.1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: screenHeight * .05),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.02),
                child: YoutubePlayer(
                  controller: _controller!,
                  showVideoProgressIndicator: true,
                  bottomActions: <Widget>[
                    const SizedBox(width: 14.0),
                    CurrentPosition(),
                    const SizedBox(width: 8.0),
                    ProgressBar(isExpanded: true),
                    RemainingDuration(),
                  ],
                  aspectRatio: 4 / 3,
                  progressIndicatorColor: Colors.white,
                  onReady: () {
                    print('Player is ready.');
                  },
                ),
              ),
              SizedBox(height: screenHeight * .05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * .05),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(Radius.circular(screenHeight * 0.03)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: screenWidth * 0.03,
                        spreadRadius: screenWidth * 0.01,
                        offset: Offset(0.0,
                            screenWidth * 0.005 // Move to bottom 8.0 Vertically
                            ),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * .05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.exerciseName,
                          style: TextStyle(
                            fontSize: screenWidth * 0.06,
                            fontFamily: 'Reemkufi',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * .02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    widget.mint,
                                    style: TextStyle(
                                      fontFamily: 'Reemkufi',
                                      fontSize: screenWidth * 0.05,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * .02),
                                  Text(
                                    "minutes",
                                    style: TextStyle(
                                        fontFamily: 'Reemkufi',
                                        fontSize: screenWidth * 0.04),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    widget.difficulty,
                                    style: TextStyle(
                                        fontFamily: 'Reemkufi',
                                        fontSize: screenWidth * 0.05),
                                  ),
                                  SizedBox(height: screenHeight * .02),
                                  Text(
                                    "difficulty",
                                    style: TextStyle(
                                        fontFamily: 'Reemkufi',
                                        fontSize: screenWidth * 0.04),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    widget.cat,
                                    style: TextStyle(
                                        fontFamily: 'Reemkufi',
                                        fontSize: screenWidth * 0.05),
                                  ),
                                  SizedBox(height: screenHeight * .02),
                                  Text(
                                    "category",
                                    style: TextStyle(
                                        fontFamily: 'Reemkufi',
                                        fontSize: screenWidth * 0.04),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Text(
                          widget.description,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: screenWidth * 0.035,
                            fontFamily: 'Reemkufi',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StopwatchScreen(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(screenWidth * .05),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(207, 234, 255, 1),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(screenHeight * 0.05)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * .01,
                                    vertical: screenHeight * .01),
                                child: Center(
                                  child: Text(
                                    "Start Exercise",
                                    style: TextStyle(
                                      fontFamily: 'Reemkufi',
                                      fontWeight: FontWeight.w400,
                                      fontSize: screenWidth * 0.05,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
