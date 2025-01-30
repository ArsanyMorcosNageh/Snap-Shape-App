
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:snap_and_shape/features/home/presentation/view/home_view.dart';

import '../../features/exercise_recommendation/presentation/view/exercise_recommendation_view.dart';
import '../../features/food_recommendation/presentation/view/food_recommendation_view.dart';
import '../../features/profile/presentation/view/profile_view.dart';

class MainView extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainView> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeView(),
    FoodRecommendationView(),
    ExerciseRecommendationView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color(0xFF670977),
        animationDuration: Duration(milliseconds: 400),
        height: 60,
        items: [
          Image.asset('assets/images/WhatsApp_Image_2024-09-26_at_3.39.30_PM-removebg-preview.png', width: 30, height: 30),
          Image.asset('assets/images/WhatsApp_Image_2024-09-26_at_3.39.30_PM-removebg-preview.png', width: 30, height: 30),
          Image.asset('assets/images/WhatsApp_Image_2024-09-26_at_3.39.30_PM-removebg-preview.png', width: 30, height: 30),
          Image.asset('assets/images/WhatsApp_Image_2024-09-26_at_3.39.30_PM-removebg-preview.png', width: 30, height: 30),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}