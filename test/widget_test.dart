// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:bug_tracker_application/main.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.

//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Update the path

void main() {
  testWidgets('Add Form works correctly', (WidgetTester tester) async {
    // 1. Pump the widget inside a MaterialApp (needed for context)
    // await tester.pumpWidget(
    //   const MaterialApp(home: Scaffold(body: AddForm)),
    // );

    // 2. Enter text in the title field
    await tester.enterText(find.byKey(const Key('titleField')), 'Login issue');

    // 3. Enter text in the description field
    await tester.enterText(
      find.byKey(const Key('descriptionField')),
      'Login button not responding',
    );

    // 4. Tap the save button
    await tester.tap(find.byKey(const Key('saveButton')));

    // 5. Trigger rebuild (optional if setState is used)
    await tester.pump();

    // 6. Check if text was entered (or use a mock callback to confirm submission)
    expect(find.text('Login issue'), findsOneWidget);
    expect(find.text('Login button not responding'), findsOneWidget);
  });
}
