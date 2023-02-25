import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/authentication/auth%20repository/authrepo.dart';
import 'firebase_options.dart';
import 'view/splash/splashscreen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((FirebaseApp value) => Get.put(AuthenticationRepo()));
  runApp(const BrewApp());
}

class BrewApp extends StatelessWidget {
  const BrewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
    );
  }
}
