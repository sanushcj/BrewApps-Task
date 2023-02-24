import 'package:brewapp_task/view/home/myhome.dart';
import 'package:brewapp_task/view/login/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'failures/signup_failure.dart';

class AuthenticationRepo extends GetxController {
  static AuthenticationRepo get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> appUser;

  @override
  void onReady() {
    appUser = Rx<User?>(_auth.currentUser);
    appUser.bindStream(_auth.userChanges());
    ever(appUser, initialScreen);
    super.onReady();
  }

  initialScreen(User? user) {
    user == null ? Get.offAll(LoginScreen()) : Get.offAll(const MyhomePage());
  }

Future<String?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      appUser.value != null ? Get.offAll(() =>  const MyhomePage()) : Get.to(() =>  LoginScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }


  

  Future<void> logout() async => await _auth.signOut();


}




