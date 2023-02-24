import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepo extends GetxController {
  static AuthenticationRepo get instance => Get.find();

final _auth = FirebaseAuth.instance;



}