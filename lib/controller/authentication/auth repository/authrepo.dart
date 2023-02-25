import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../view/home/myhome.dart';
import '../../../view/login/loginscreen.dart';
import 'failures/signup_in_failure.dart';

class AuthenticationRepo extends GetxController {
  static AuthenticationRepo get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final Rx<User?> appUser;

  @override
  void onReady() {
    appUser = Rx<User?>(_auth.currentUser);
    appUser.bindStream(_auth.userChanges());
    ever(appUser, initialScreen);
    super.onReady();
  }

 void initialScreen(User? user) {
    user == null ? Get.offAll(LoginScreen()) : Get.offAll(const MyhomePage());
  }

Future<String?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      appUser.value != null ? Get.offAll(() =>  const MyhomePage()) : Get.to(() =>  LoginScreen());
    } on FirebaseAuthException catch (e) {
      final SignUpandInWithEmailAndPasswordFailure err = SignUpandInWithEmailAndPasswordFailure.code(e.code);
      return err.message;
    } catch (_) {
      const SignUpandInWithEmailAndPasswordFailure err = SignUpandInWithEmailAndPasswordFailure();
      return err.message;
    }
    return null;
  }

  Future<String?> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final SignUpandInWithEmailAndPasswordFailure err = SignUpandInWithEmailAndPasswordFailure.code(e.code);
      return err.message;
    } catch (_) {
      const SignUpandInWithEmailAndPasswordFailure err = SignUpandInWithEmailAndPasswordFailure();
      return err.message;
    }
    return null;
  }
  

  Future<void> logout() async =>  _auth.signOut();


}
