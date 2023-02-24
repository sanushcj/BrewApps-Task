

import 'package:brewapp_task/controller/authentication/signup/signupcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/colors/colors.dart';
import '../../core/const/constants.dart';
import '../login/loginscreen.dart';
import '../login/widgets/mytextfield.dart';
import '../login/widgets/signinbutton.dart';

class RegisterNow extends StatelessWidget {
  RegisterNow({super.key});

SignUpController controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: premiumGrey,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                rrheight50,
                SizedBox(
                    height: 100,
                    width: 200,
                    child: Image.asset(
                      'assets/imgs/cropped-Logo1-156x80.png',
                      fit: BoxFit.fill,
                    )),
                rrheight50,
                Text(
                  'Create Account',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 25),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      MyTextField(
                        controller: controller.signupUsernameController,
                        hintText: 'Username',
                        obscureText: false,
                      ),
                      rrheight10,
                      MyTextField(
                        controller: controller.signupEmailController,
                        hintText: 'email',
                        obscureText: true,
                      ),
                      rrheight10,
                      MyTextField(
                        controller: controller.signupPasswordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                rrheight10,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                SignInButton(
                  onTap: () => controller.registerUser(email: controller.signupEmailController.text.trim(),pass: controller.signupPasswordController.text.trim()),
                ),
                rrheight50,
                rrheight50,
                rrheight50,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () => Get.to(() => LoginScreen()),
                      child: const Text(
                        'Sign In Now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
