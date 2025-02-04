import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/clip_paths.dart';
// استيراد ملف Clip Paths


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // استخدام TopClipper
          ClipPath(
            clipper: TopClipper(),
            child: Container(
              color: const Color(0xFF670977),
              height: MediaQuery.of(context).size.height * 0.5,
            ),
          ),
          // استخدام BottomClipper
          ClipPath(
            clipper: BottomClipper(),
            child: Container(
              color: const Color(0xFF670977),
              height: MediaQuery.of(context).size.height,
            ),
          ),
          // Center logo
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: SvgPicture.asset(
                    'assets/logo.svg', // ضع هنا مسار ملف الـ SVG
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Snap & Shape',
                  style: TextStyle(
                    fontSize: 24,
                    color: const Color(0xFF670977),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
