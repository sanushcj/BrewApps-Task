import 'package:brewapp_task/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/splash/splashscreen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const BrewApp());
}

class BrewApp extends StatelessWidget {
  const BrewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
    );
  }
}