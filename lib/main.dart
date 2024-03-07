import 'package:flutter/material.dart';
import 'package:mindfulmoments/screens/onboarding.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: onBoarding(),
    );
  }
}