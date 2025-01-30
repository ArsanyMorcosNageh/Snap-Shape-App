import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snap_and_shape/core/widgets/spash_screen.dart';
import 'package:snap_and_shape/features/questionaire/presentation/view/questionaire_view.dart';
import 'features/onboarding/presentation/view/onboarding_view.dart';
import 'features/home/presentation/view/home_view.dart';
import 'features/sign_up/presentation/view/sign_up_view.dart'; // استيراد Home Screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final prefs = await SharedPreferences.getInstance();
  // final bool onboardingCompleted = prefs.getBool('onboarding_completed') ?? false;
//onboardingCompleted: onboardingCompleted
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //final bool onboardingCompleted;
  //required this.onboardingCompleted
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snap & Shape',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      //home : Test(),
      // home :SplashScreen(),
      home: SignUpView(),
      //     home: const OnboardingView(),
      //home: onboardingCompleted ? const HomeView() : const OnboardingView(),
    );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 100,
        ),
        Image.asset("assets/images/ww.png"),
      ]),
    );
  }
}
