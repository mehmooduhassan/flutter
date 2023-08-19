import 'package:flutter/material.dart';
import 'package:untitledcalculator/calculator_app.dart';
import 'package:untitledcalculator/splashScreen_data/Screen1.dart';
import 'package:untitledcalculator/splashScreen_data/routers.dart';
import 'package:untitledcalculator/splashScreen_data/routerNames.dart';
import 'package:untitledcalculator/splashScreen_data/screenthree.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: calculator(),

    );
  }
}
