import 'package:flutter/material.dart';
import 'package:shoishob/utils/routes/route_name.dart';
import 'package:shoishob/view/home_screen.dart';
import 'package:shoishob/view/login_screen.dart';
import 'package:shoishob/view/verify_email.dart';

import '../../view/dashboard.dart';
import '../../view/forgot_password.dart';
import '../../view/game_zone.dart';
import '../../view/health_tracker.dart';
import '../../view/profile_screen.dart';
import '../../view/register_screen.dart';
import '../../view/training_screen.dart';
import '../../view/welcome_screen.dart';
import '../../view/workout_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteName.registerScreen:
        return MaterialPageRoute(builder: (_) => const ResisterScreen());
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteName.dashBoard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case RouteName.healthScreen:
        return MaterialPageRoute(builder: (_) => const HaelthTracker());
      case RouteName.trainingScreen:
        return MaterialPageRoute(builder: (_) => const TrainScreen());
      case RouteName.workoutScreen:
        return MaterialPageRoute(builder: (_) => const WorkScreen());
      case RouteName.gameZone:
        return MaterialPageRoute(builder: (_) => const GameZone());
      case RouteName.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case RouteName.forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case RouteName.verifyEmail:
        return MaterialPageRoute(builder: (_) => const EmailVerify());


      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            );
          },
        );
    }
  }
}
