import 'package:flutter/material.dart';

class FoodRecommendationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(1),
      color: Colors.white,
      child: Center(child: Text('Food Recommendation', style: TextStyle(fontSize: 24))),
    );
  }
}