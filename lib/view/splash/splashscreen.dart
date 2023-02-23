import 'package:brewapp_task/core/colors/colors.dart';
import 'package:brewapp_task/view/login/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    gotoHome();

    double heightof = MediaQuery.of(context).size.height;
    double widthof = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: premiumcolor,
        height: heightof,
        width: widthof,
        child: const Center(
          child: Text(
            'BrewAPPS TASK',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
        ),
      ),
    );
  }

  gotoHome() async {
    await Future.delayed(const Duration(seconds:4 ));
    await Get.offAll(() =>  LoginScreen());
  }
}
