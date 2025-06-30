import 'package:bug_tracker_application/Features/Presenetation/screens/on_boarding_screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogInScreen()),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/image /ChatGPT Image Jun 25, 2025, 03_42_26 AM.png",
            ),
          ),
        ),
      ),
      // body: Image.asset(
      //   fit: BoxFit.contain,
      //   "assets/image /ChatGPT Image Jun 25, 2025, 03_42_26 AM.png",
      // ),
    );
  }
}
