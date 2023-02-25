import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../view/login/loginscreen.dart';

class ForgotPasswordController extends GetxController {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController forgotpassController = TextEditingController();

 Future<void> resetUserPassword({required String email}) async {
    try {
      _auth.sendPasswordResetEmail(email: email);
      Get.snackbar(
          'Password Reset mail send Sucessfully', 'Please Check your Mail');
      forgotpassController.dispose();
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Please check your mail', '$e',
          duration: const Duration(seconds: 4));
      forgotpassController.dispose();
    }
  }
}
