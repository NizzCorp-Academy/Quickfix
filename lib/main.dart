import 'package:bug_tracker_application/Features/Bug_tracker/DATA/Repositories/bug_services/bug_services.dart';
import 'package:bug_tracker_application/Features/Bug_tracker/DATA/Services/fcm_notification.dart';

import 'package:bug_tracker_application/Features/Authentication/PRESENTATION/Auhentication_bloc/auth_bloc.dart';
import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/Bloc/Bug/bug_bloc.dart';
import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/Screens/Main_screens/home_screen.dart';
import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/Screens/Main_screens/splash_screen.dart';

import 'package:bug_tracker_application/firebase_options.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (BuildContext context) => AuthBloc()),

        BlocProvider<BugBloc>(
          create:
              (BuildContext context) =>
                  BugBloc(BugService())..add(BugLoadEvent()),
        ),
      ],
      child: MyApp(),
    ),
  );
  await FcmNotificationService().registerPushNotificationHandler();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return SplashScreen();
          }
        },
      ),
    );
  }
}
