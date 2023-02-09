import 'package:flutter/material.dart';
import 'package:webtoom/screens/home_screen.dart';
import 'package:webtoom/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web toom',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}
