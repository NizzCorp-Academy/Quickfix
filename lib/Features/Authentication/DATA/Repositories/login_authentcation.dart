import 'package:bug_tracker_application/Features/Authentication/PRESENTATION/Screen/auth/login_screen.dart';
import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/screens/Main_screens/home_screen.dart';

import 'package:bug_tracker_application/core/constants/color_costants/color_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// ------------------------------
/// LoginAuthentication - Service Class
/// ------------------------------
///
/// Purpose:
/// This service class handles user authentication using FirebaseAuth.
/// Provides methods to register a new user and log in an existing user.
/// It also manages success/error feedback using SnackBars and navigation.
///
/// Usage:
/// - Call `register()` for user signup.
/// - Call `login()` for user login.
///
/// This class is directly used inside your BLoC or Presentation Layer.
/// -------------------------------------------------------------------------------------------------------

class LoginAuthentcation {
  /// Registers a new user with [email/] and [password/] using Firebase Authentication.
  ///
  /// If registration is successful, shows a success message and navigates to the Login Screen.
  /// If the email is already in use or the password is weak, shows an error message.
  ///
  /// Parameters:
  /// - [email/] The user's email address.
  /// - [password/] The user's password.
  /// - [context/] The BuildContext used for showing SnackBars and navigation.
  /// -----------------------------------------------------------------------------------------------------
  Future<void> register(
    String name,
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance
          .collection("user")
          .doc(credential.user!.uid)
          .set({"name": name, "email": email});
      await credential.user!.updateDisplayName(name);

      // await credential.user!.reload();
      if (credential.user?.email != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: ColorConstant.loginGreen,
            content: Text("User registered successful"),
          ),
        );
        print("CURRENT USER :${name}");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LogInScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: ColorConstant.mainRed,
            content: Text("email already exists"),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }
  // -----------------------------------------------------------------------------------
  ///////// On Login /////////////////////////////////////

  /// Logs in an existing user with [email] and [password] using Firebase Authentication.
  ///
  /// On successful login, navigates the user to the Home Screen.
  /// If the credentials are incorrect, displays an error message.
  ///
  /// Parameters:
  /// - [email] The user's email address.
  /// - [password] The user's password.
  /// - [context] The BuildContext used for showing SnackBars and navigation.

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user?.email != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorConstant.mainRed,
          content: Text("Email or password is incorrect"),
        ),
      );
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
