import 'package:flutter/material.dart';


class WorkoutTile extends StatelessWidget {
  const WorkoutTile(
      {super.key,
      required this.pic,
      required this.name,
      required this.level,
      required this.duration,
      required this.widget});
  final String pic, name, level, duration;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * .02),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 0.05),
          boxShadow: [
            BoxShadow(
              blurRadius: screenWidth * 0.02,
              spreadRadius: screenWidth * 0.005,
              color: Colors.grey.withOpacity(.5),
              offset: Offset(
                0.0, // Move to right 7.0 horizontally
                screenWidth * 0.005,
              ),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(pic, height: screenHeight * .1),
            Column(
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: screenWidth * .06,
                    fontFamily: "Raleway",
                  ),
                ),
                Text(
                  "Level: ${level}",
                  style: TextStyle(
                    fontFamily: 'subtile',
                    fontSize: screenWidth * .03,
                      fontWeight: FontWeight.w900

                  ),
                ),
                Text(
                  "duration $duration minutes",
                  style: TextStyle(
                    fontFamily: 'subtile',
                    fontSize: screenWidth * .03,
                    fontWeight: FontWeight.w900
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => widget,
                      ),
                    );
                    // Navigator.pushNamed(
                    //     context, RouteName.breathTrain);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * .02),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(207, 234, 255, 1),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.1,
                            vertical: screenHeight * 0.01),
                        child: Center(
                          child: Text(
                            "Start Now",
                            style: TextStyle(
                              fontFamily: 'Reemkufi',
                              fontWeight: FontWeight.w400,
                              fontSize: screenWidth * .04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
