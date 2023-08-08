import 'package:flutter/material.dart';
import 'package:shoishob/res/components/exercise.dart';
import 'package:shoishob/res/components/workoutTile.dart';

class WorkScreen extends StatefulWidget {
  const WorkScreen({super.key});

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: screenHeight * 1,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * .05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Workout\nAnd Meditation",
                  style: TextStyle(
                    fontSize: screenWidth * 0.1,
                    fontFamily: 'Raleway',
                  ),
                ),
                SizedBox(height: screenHeight * .05),
                Column(
                  children: [
                    WorkoutTile(
                      pic: 'assets/images/lunges.jpg',
                      name: "Lunges",
                      level: "Easy",
                      duration: "20",
                      widget: ExerciseOverview(
                        cat: "Legs",
                        description:
                            "A lunge can refer to any position of the human body where one leg is positioned forward with knee bent and foot flat on the ground while the other leg is positioned behind.",
                        difficulty: "Easy",
                        exerciseName: "Lunges",
                        mint: "10",
                        videoLink:
                            "https://www.youtube.com/watch?v=wrwwXE_x-pQ&t=22s&ab_channel=MindBodySoul",
                      ),
                    ),
                    WorkoutTile(
                      pic: 'assets/images/Push-up.webp',
                      name: "Push-Ups",
                      level: "Medium",
                      duration: "15",
                      widget: ExerciseOverview(
                        cat: "Chest",
                        description:
                            "exercise in which a person, keeping a prone position with the hands palms down under the shoulders, the balls of the feet on the ground, and the back straight, pushes the body up and lets it down by an alternate straightening and bending of the arms",
                        difficulty: "Medium",
                        exerciseName: "Push-Ups",
                        mint: "15",
                        videoLink:
                            "https://www.youtube.com/watch?v=t0s5FHbdBmA&ab_channel=MindBodySoul",
                      ),
                    ),
                    WorkoutTile(
                      pic: 'assets/images/squats.jpg',
                      name: "Squats",
                      level: "Medium",
                      duration: "10",
                      widget: ExerciseOverview(
                        cat: "Legs",
                        description:
                            "Squats increase lower body and core strength, as well as flexibility in your lower back and hips. Because they engage some of the largest muscles in the body, they also pack a major punch in terms of calories burned.",
                        difficulty: "Medium",
                        exerciseName: "Squats",
                        mint: "10",
                        videoLink:
                            "https://www.youtube.com/watch?v=YaXPRqUwItQ&ab_channel=MindBodySoul",
                      ),
                    ),
                    WorkoutTile(
                      pic: 'assets/images/burpes.jpg',
                      name: "Burpee",
                      level: "Hard",
                      duration: "10",
                      widget: ExerciseOverview(
                        cat: "Muscle",
                        description:
                            "An exercise we love to hate, burpees are a super-effective, whole-body move that provides great bang for your buck for cardiovascular endurance and muscle strength.",
                        difficulty: "Hard",
                        exerciseName: "Burpee",
                        mint: "10",
                        videoLink:
                            "https://www.youtube.com/watch?v=NCqbpkoiyXE&ab_channel=NuffieldHealth",
                      ),
                    ),
                    WorkoutTile(
                      pic: 'assets/images/SidePlanks.png',
                      name: "Side planks",
                      level: "Hard",
                      duration: "10",
                      widget: ExerciseOverview(
                        cat: "Body",
                        description:
                            "A healthy body requires a strong core at its foundation, so don’t neglect core-specific moves like the side plank.",
                        difficulty: "Hard",
                        exerciseName: "Side Planks",
                        mint: "10",
                        videoLink:
                            "https://www.youtube.com/watch?v=rCxF2nG9vQ0&ab_channel=GetExerciseConfident",
                      ),
                    ),
                    WorkoutTile(
                      pic: 'assets/images/planks.jpg',
                      name: "planks",
                      level: "Hard",
                      duration: "03",
                      widget: ExerciseOverview(
                        cat: "Body",
                        description:
                            "Planks are an effective way to target both your abdominal muscles and your whole body. Planking stabilizes your core without straining your back the way situps or crunches might.",
                        difficulty: "Hard",
                        exerciseName: "Planks",
                        mint: "03",
                        videoLink:
                            "https://www.youtube.com/watch?v=BQu26ABuVS0&ab_channel=WaysAndHow",
                      ),
                    ),
                    WorkoutTile(
                      pic: 'assets/images/glute.jpg',
                      name: "Glute bridge",
                      level: "Medium",
                      duration: "08",
                      widget: ExerciseOverview(
                        cat: "Body",
                        description:
                        "The glute bridge effectively works your entire posterior chain, which isn’t only good for you, but it’ll make your booty look perkier, too.",
                        difficulty: "Medium",
                        exerciseName: "Glute bridge",
                        mint: "08",
                        videoLink:
                            "https://www.youtube.com/watch?v=hlth_Of9LEc&ab_channel=InnerStrength",
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
