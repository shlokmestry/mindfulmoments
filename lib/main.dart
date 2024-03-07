import 'package:flutter/material.dart';
import 'package:mindfulmoments/screens/onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

);
  
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