import 'package:flutter/material.dart';
import 'package:mindful_meal_timer/mmt/page_change.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mindful Meal Timer',
      home:TimerPagechange(),
      debugShowCheckedModeBanner: false,
    );
  }
}

