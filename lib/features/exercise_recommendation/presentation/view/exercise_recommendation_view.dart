import 'package:flutter/material.dart';

class ExerciseRecommendationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(2),
      color: Colors.white,
      child: Center(child: Text('Exercise Recommendation', style: TextStyle(fontSize: 24))),
    );
  }
}
