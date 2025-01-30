import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(0),
      color: Colors.white,
      child: Center(child: Text('Home', style: TextStyle(fontSize: 24))),
    );
  }
}
