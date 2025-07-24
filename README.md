<!-- # bug_tracker_application
check out : https://shafeequegithubb.github.io/Bug_web/

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference. -->



# Bug Tracker Application


A Flutter app to track and manage software bugs efficiently using Firebase as the backend and BLoC for state management.


## USAGE

  ## 1.  Register/login
  
  Open the app and create a new account using your email and password, or log in if you already have an account.

## 2.Dashboard / Bug List

    After logging in, you will see the list of all bugs assigned to you or visible based on your role.
    Bugs show basic info like title, severity, status, and assigned developer.

## 3.Adding a New Bug
    Tap the Add Bug button (usually a "+" floating action button).
    Fill in details such as:

    Title: Short description of the bug
    Description: Detailed information
    Assigned Developer: Select from a list of developers
    Severity: Low, Medium, High
    Status: New, In Progress, Fixed, etc.
    Save to add the bug to Firestore.

## 4. Editing a Bug
Tap on a bug in the list to view details.
Use the Edit button to update bug info, change status, or reassign.

## 5.Filtering Bugs
Use filter options (available via Home screen) ,status and severity:
Status (e.g., only "Fixed"/"unfixed" bugs);
severity (low,medium,high)
Severity

# 6 Status and Streaks
View your bug fixing stats and streaks on the stats screen (open drawer > report).


## Features

- Add, edit, and delete bugs  
- Assign bugs to developers  
- Filter bugs by status, severity, and date  
- View bug details and fix logs  
- Firebase Authentication (email/password)  
- Push Notifications using Firebase Messaging

## Technologies Used

- Flutter  
- Firebase (Firestore, Authentication, Messaging)  
- Flutter BLoC  
- Dart

