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

    return Scaffold(
      body: Container(
        color: premiumcolor,
        height: heightof,
        width: widthof,
        child: Center(
          child: Column(
            children: [
              const Text(
                'BrewAPPS TASK',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              Obx(
                () => Visibility(
                    visible: loading.value,
                    child: const SizedBox(
                      width: 80,
                      height: 80,
                      child: CupertinoActivityIndicator(),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  gotoHome() async {
    loading.value = true;
    await Future.delayed(const Duration(seconds: 3));
  }
}
