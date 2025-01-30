import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snap_and_shape/core/navigation/bottom_navigation_bar.dart';
import 'package:snap_and_shape/features/sign_in/presentation/view/sign_in_view.dart';
import '../../../../core/utils/clip_paths.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Welcome,\n to Snap & Shape...',
      'description':
          'Scala, track your meals, receive personalized food recommendations, and enjoy tailored exercise plans just for you.',
      'image': 'assets/images/test.svg',
    },
    {
      'title': 'Smart Food Recognition',
      'description':
          'Snap a photo of your meal, and we will do the rest!\nGet accurate measurements and analyze the quality of your food effortlessly.',
      'image': 'assets/images/test.svg',
    },
    {
      'title': 'Track Your Progress',
      'description':
          'Keep an eye on your daily calorie intake and track your weight changes!',
      'image': 'assets/images/test.svg',
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _navigateToHome() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_completed', true);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>  SignInView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  // ClipPath العلوي

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
                  // المحتوى الرئيسي
                  OnboardingPage(
                    title: onboardingData[index]['title']!,
                    description: onboardingData[index]['description']!,
                    image: onboardingData[index]['image']!,
                    isLastPage: index == onboardingData.length - 1,
                    onGetStarted: _navigateToHome,
                  ),
                ],
              );
            },
          ),

          // مؤشر الصفحات
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? Color(0xFFF9AB0B)
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final bool isLastPage;
  final VoidCallback onGetStarted;

  const OnboardingPage({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    required this.isLastPage,
    required this.onGetStarted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            width: 250,
            height: 250,
          ),
          const SizedBox(height: 40),
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF670977),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            description,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          if (isLastPage)
            ElevatedButton(
              onPressed: onGetStarted,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF9AB0B),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
