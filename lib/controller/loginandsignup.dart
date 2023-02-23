import 'package:brewapp_task/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSignUp extends GetxController {
  
@override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
signupUsernameController.dispose();
 signupPasswordController.dispose();
 signupEmailController .dispose();
    super.dispose();
  }

  final TextEditingController  signupUsernameController = TextEditingController();
  final TextEditingController  signupPasswordController = TextEditingController();
  final TextEditingController  signupEmailController = TextEditingController();

   final TextEditingController loginusernameController = TextEditingController();
   final TextEditingController loginpasswordController = TextEditingController();



  void signUserIn() async {
 await Firebase }

}