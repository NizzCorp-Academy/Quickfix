// import 'package:bug_tracker_application/Features/Domain/services/bug_services/bug_services.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:bug_tracker_application/Features/Presenetation/screens/Main_screens/home_screen.dart';
// import 'package:bug_tracker_application/Features/Presenetation/Bloc/Bug/bug_bloc.dart';

// void main() {


// setUpAll(() async {
//   TestWidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
// });
//   testWidgets('HomeScreen AppBar shows title and icons', (
//     WidgetTester tester,
//   ) async {
//     final fakeBloc = BugBloc(BugService()); 
//     await tester.pumpWidget(
//       MaterialApp(
//         home: BlocProvider<BugBloc>.value(
//           value: fakeBloc,
//           child: const HomeScreen(),
//         ),
//       ),
//     );

//     await tester.pumpAndSettle();

//     // ✅ Check AppBar title
//     expect(find.text('BUG TRACKER'), findsOneWidget);

//     // // ✅ Check notification icon
//     // expect(find.byIcon(Icons.notification_add), findsOneWidget);

//     // // ✅ Check drawer menu icon (hamburger icon)
//     // expect(find.byTooltip('Open navigation menu'), findsOneWidget);
//   });
// }
