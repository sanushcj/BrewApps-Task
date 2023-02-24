import 'package:brewapp_task/controller/authentication/signup/signupcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/colors/colors.dart';
import '../../core/const/constants.dart';
import '../login/loginscreen.dart';
import '../widgets/mytextfield.dart';
import '../widgets/signinbutton.dart';

class RegisterNow extends StatelessWidget {
  RegisterNow({super.key});

  final _formKey = GlobalKey<FormState>();

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
                  autovalidateMode: AutovalidateMode.disabled,
                  key: _formKey,
                  child: Column(
                    children: [
                      MyTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please Enter your Good name';
                          }
                          return null;
                        },
                        controller: controller.signupUsernameController,
                        hintText: 'Username',
                        obscureText: false,
                      ),
                      rrheight10,
                      MyTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please Enter your Email';
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return 'please Enter Valid Email';
                          }
                          return null;
                        },
                        controller: controller.signupEmailController,
                        hintText: 'email',
                        obscureText: true,
                      ),
                      rrheight10,
                      MyTextField(
                        validator: (value) {
                          if (value!.length < 5) {
                            return 'Enter a strong password';
                          }
                          return null;
                        },
                        controller: controller.signupPasswordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                      rrheight10,
                      //confirm pass
                      MyTextField(
                        validator: (value) {
                          if (value!.length < 5) {
                            return 'Enter a strong password';
                          }
                          if (value != controller.signupPasswordController.text) {
                            return "Password must be same as above";
                          }
                          return null;
                        },
                        controller: controller.signupConfirmPasswordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                rrheight10,
                rrheight10,
                const SizedBox(height: 25),
                SignInButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      controller.registerUser(
                          email: controller.signupEmailController.text.trim(),
                          pass:
                              controller.signupPasswordController.text.trim());
                    }
                  },
                ),
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
