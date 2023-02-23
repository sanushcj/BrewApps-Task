import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/splash/splashscreen.dart';

void main() {
  runApp(const BrewApp());
}

class BrewApp extends StatelessWidget {
  const BrewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
    home: SplashScreen(),
    );
  }
}