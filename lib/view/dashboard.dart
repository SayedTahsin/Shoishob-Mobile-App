import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shoishob/services/UserInfoClass.dart';
import 'package:shoishob/view/health_tracker.dart';
import 'game_zone.dart';
import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  void initState() {
    // TODO: implement initState
    UserInfoClass();
    super.initState();
  }
  final controller = PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreen() {
    return [
      HomeScreen(),
      GameZone(),
      HaelthTracker(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItem() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.home,
          color: Colors.black,
        ),
        inactiveIcon: const Icon(
          Icons.home_outlined,
          color: Colors.black,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.local_fire_department_rounded,
          color: Colors.white,
        ),
        inactiveIcon: const Icon(
          Icons.local_fire_department_rounded,
          color: Colors.black,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.favorite,
          color: Colors.black,
        ),
        inactiveIcon: const Icon(
          Icons.favorite_outline,
          color: Colors.black,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // UserInfoClass();
    return PersistentTabView(
      context,
      screens: _buildScreen(),
      items: _navBarItem(),
      controller: controller,
      backgroundColor: Colors.white,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          const BoxShadow(
            blurRadius: 15.0,
            spreadRadius: 0.5,
            color: Colors.grey,
            offset: Offset(
              0.0, // Move to right 7.0 horizontally
              -2.0, // Move to bottom 8.0 Vertically
            ),
          ),
        ],
      ),
      navBarStyle: NavBarStyle.style16,
    );
  }
}
