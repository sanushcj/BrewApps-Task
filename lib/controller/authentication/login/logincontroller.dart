import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth%20repository/authrepo.dart';

class LoginController extends GetxController {
  @override
  void dispose() {
    loginusernameController.dispose();
    loginpasswordController.dispose();
    super.dispose();
  }

  final TextEditingController loginusernameController = TextEditingController();
  final TextEditingController loginpasswordController = TextEditingController();

  Future<void> signInuser(
      {required String email, required String password}) async {
    await AuthenticationRepo.instance
        .loginWithEmailAndPassword(email, password);
    loginusernameController.clear();
    loginpasswordController.clear();
  }
}
