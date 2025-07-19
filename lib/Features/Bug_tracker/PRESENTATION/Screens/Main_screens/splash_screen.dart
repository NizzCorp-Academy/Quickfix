
import 'package:bug_tracker_application/Features/Authentication/PRESENTATION/Screen/auth/login_screen.dart';

import 'package:flutter/material.dart';


/// ------------------------------
/// SplashScreen - Initial App Loading Screen
/// ------------------------------
///
/// **Purpose:**
/// - Acts as the first screen of the application.
/// - Displays a splash image while the app initializes.
/// - After 2 seconds delay, navigates to `LogInScreen`.
///
/// **Features Covered:**
/// - Timed navigation using `Future.delayed()`.
/// - Stateless navigation to LoginScreen.
/// - Simple full-screen image background.
///
/// **Usage:**
/// - Shown automatically when the app starts.
/// - Prepares the user visually for the app transition.
///
/// 


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
     
    );
  }
}
