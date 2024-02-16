
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:netflix/screens/OnboardingScreen.dart';
import 'package:netflix/screens/homescreen.dart';

import 'firebase_options.dart';
import 'screens/Search.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Netflix",
      initialRoute: '/',
      routes: {
        '/HomeScreen': (context) => HomeScreen(),
        '/Search': (context) => SearchPage(),
        '/Download': (context) => Placeholder(),
        '/More': (context) => Placeholder(),

      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  OnboardingScreen(),
    );
  }
}
