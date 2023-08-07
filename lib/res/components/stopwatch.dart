import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shoishob/res/colors.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  int _seconds = 0;
  bool _isRunning = false;
  late Timer _timer;
  List<String> _laps = [];

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _start() {
    if (!_isRunning) {
      _startTimer();
      _isRunning = true;
    }
  }

  void _stop() {
    if (_isRunning) {
      _timer.cancel();
      _isRunning = false;
    }
  }

  void _reset() {
    _timer.cancel();
    setState(() {
      _seconds = 0;
      _isRunning = false;
      _laps.clear();
    });
  }

  void _recordLap() {
    if (_isRunning) {
      String lapTime = _formatTime(_seconds);
      setState(() {
        _laps.insert(0, lapTime);
      });
    }
  }

  String _formatTime(int seconds) {
    int minutes = (seconds ~/ 60);
    int remainingSeconds = seconds % 60;

    String formattedTime =
        '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
      ),
      body: Container(
        height: screenHeight * 1.1,
        width: screenWidth * 1.1,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.subtitle1.withOpacity(.15),
                  borderRadius: BorderRadius.circular(screenWidth * 0.07),
                ),
                child: Center(
                  child: Text(
                    _formatTime(_seconds),
                    style: TextStyle(fontSize: screenWidth * 0.3),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _isRunning ? null : _start,
                    child: Text(
                      'Start',
                      style: TextStyle(
                        fontSize: screenWidth * .03,
                        fontFamily: "Raleway",
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  ElevatedButton(
                    onPressed: _isRunning ? _stop : null,
                    child: Text(
                      'Stop',
                      style: TextStyle(
                        fontSize: screenWidth * .03,
                        fontFamily: "Raleway",
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  ElevatedButton(
                    onPressed: _reset,
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: screenWidth * .03,
                        fontFamily: "Raleway",
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  ElevatedButton(
                    onPressed: _recordLap,
                    child: Text(
                      'Lap',
                      style: TextStyle(
                        fontSize: screenWidth * .03,
                        fontFamily: "Raleway",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Laps",
                style: TextStyle(
                    fontSize: screenWidth * .1,
                    fontFamily: "subtile",
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenHeight * 0.01),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.heading1.withOpacity(.15),
                    borderRadius: BorderRadius.circular(screenWidth * 0.1),
                  ),
                  child: ListView.builder(
                    itemCount: _laps.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Text(
                          'Lap ${index + 1}:\t\t\t ${_laps[index]}',
                          style: TextStyle(
                            fontSize: screenWidth * .05,
                            fontWeight: FontWeight.bold,
                            fontFamily: "subtile",
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
