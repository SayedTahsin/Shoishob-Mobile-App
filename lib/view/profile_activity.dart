import 'package:flutter/material.dart';

import '../res/components/Tile2.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.only(bottom: screenHeight * 0.05),
        child: Column(
          children: [
            Tile2(
              clr: Colors.orangeAccent,
              text: "Earned Gold In Management",
              icn: Icons.file_download_done_rounded,
              date: "May 1 , 2022",
            ),
            Tile2(
              clr: Colors.grey,
              text: "Earned Silver In Drive Thru",
              icn: Icons.file_download_done_rounded,
              date: "Jan 16 , 2022",
            ),
            Tile2(
              clr: Colors.brown,
              text: "Earned Bronze In Drive-Thru 101",
              icn: Icons.file_download_done_rounded,
              date: "Jan 16 , 2022",
            ),
            Tile2(
              clr: Colors.orangeAccent,
              text: "Earned Gold In Management",
              icn: Icons.file_download_done_rounded,
              date: "May 1 , 2022",
            ),
            Tile2(
              clr: Colors.brown,
              text: "Earned Bronze In Drive-Thru 101",
              icn: Icons.file_download_done_rounded,
              date: "Jan 16 , 2022",
            ),
            Tile2(
              clr: Colors.orangeAccent,
              text: "Earned Gold In Management",
              icn: Icons.file_download_done_rounded,
              date: "May 1 , 2022",
            ),
          ],
        ),
      ),
    );
  }
}
