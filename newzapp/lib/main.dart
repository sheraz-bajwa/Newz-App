import 'package:flutter/material.dart';
import 'package:newzapp/screens/AllCountryNewz.dart';
import 'package:newzapp/screens/DifferentSources.dart';
import 'package:newzapp/screens/SplashScreen.dart';
import 'package:newzapp/screens/TechCrunch.dart';
import 'package:newzapp/screens/TopHeadlines.dart';
import 'package:newzapp/screens/categories.dart';
import 'package:newzapp/screens/landing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        //textTheme: TextTheme(titleMedium: TextStyle(color: Colors.amber))
      ),
      home: Landing(),
    );
  }
}
