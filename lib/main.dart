import 'package:flutter/material.dart';
import 'package:health_care/screens/home_page.dart';
import 'package:health_care/util/const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      home: HomeScreen(),
    );
  }
}

