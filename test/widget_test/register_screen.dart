
import 'package:bug_tracker_application/Features/Authentication/PRESENTATION/Screen/auth/registerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Register screen UI test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

    ////// Check static text widget ///////
    expect(find.text("Sign up for free"), findsOneWidget);
    expect(find.text("You have already an a account ?"), findsOneWidget);

    final textfields = find.byType(TextFormField);
    expect(textfields, findsNWidgets(3));

    expect(find.widgetWithText(ElevatedButton, "Sign up"), findsOneWidget);

    ////// Test passed for register screen /////
  });
}
