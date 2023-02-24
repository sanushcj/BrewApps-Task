import 'package:brewapp_task/controller/authentication/auth%20repository/authrepo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  @override
  void dispose() {
    loginusernameController.dispose();
    loginpasswordController.dispose();
    super.dispose();
  }

  final TextEditingController loginusernameController = TextEditingController();
  final TextEditingController loginpasswordController = TextEditingController();

  signInuser({required String email, required String password}) {
    AuthenticationRepo.instance.loginWithEmailAndPassword(email, password);
  }
}
