import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/colors/colors.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  RxBool loading = false.obs;

  @override
  Widget build(BuildContext context) {
    // gotoHome();
  final  double heightof = MediaQuery.of(context).size.height;
   final double widthof = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
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
      ),
    );
  }

  // gotoHome() async {
  //   loading.value = true; }
}
