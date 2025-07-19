
import 'package:bug_tracker_application/Features/Authentication/PRESENTATION/Screen/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login Screen Test', (WidgetTester tester) async {
    /////// test checking the login screen static text widgets //////
    await tester.pumpWidget(MaterialApp(home: LogInScreen()));
    expect(find.text("Sign up"), findsOneWidget);
    expect(find.text("Sign in"), findsWidgets);
    expect(find.text("Register your account"), findsOneWidget);

    ///// Checking the text fields  Email and password /////
    final textFields = find.byType(TextFormField);
    expect(textFields, findsNWidgets(2));

    expect(find.byKey(const Key("emailField")), findsOneWidget);
    expect(find.byKey(const Key("passwordField")), findsOneWidget);
    ////passed the test login screen /////
  });
}
