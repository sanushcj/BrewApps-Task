import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth%20repository/authrepo.dart';

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
    signupUsernameController.clear();
    signupConfirmPasswordController.clear();
    signupPasswordController.clear();
    signupEmailController.clear();

  }
}
