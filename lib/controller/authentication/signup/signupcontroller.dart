import 'package:brewapp_task/controller/authentication/auth%20repository/authrepo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();


  final TextEditingController signupUsernameController =
      TextEditingController();
        final TextEditingController signupConfirmPasswordController =
      TextEditingController();
  final TextEditingController signupPasswordController =
      TextEditingController();
  final TextEditingController signupEmailController = TextEditingController();

  void registerUser({required String email, required String pass}) {
    AuthenticationRepo.instance.createUserWithEmailAndPassword(email, pass);
  }
}
