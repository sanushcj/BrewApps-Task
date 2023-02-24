import 'package:brewapp_task/controller/authentication/auth%20repository/authrepo.dart';
import 'package:brewapp_task/core/colors/colors.dart';
import 'package:brewapp_task/view/home/myhome.dart';
import 'package:brewapp_task/view/login/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  RxBool loading = false.obs;

  @override
  Widget build(BuildContext context) {
    gotoHome();
    double heightof = MediaQuery.of(context).size.height;
    double widthof = MediaQuery.of(context).size.height;

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

  gotoHome() async {
    loading.value = true; }
}
