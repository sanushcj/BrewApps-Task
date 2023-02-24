import 'package:brewapp_task/controller/authentication/login/logincontroller.dart';
import 'package:brewapp_task/core/colors/colors.dart';
import 'package:brewapp_task/core/const/constants.dart';
import 'package:brewapp_task/view/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/mytextfield.dart';
import '../widgets/signinbutton.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController _controller = Get.put(LoginController());
  final _formkey = GlobalKey<FormState>();

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
                  'Welcome back 🤩 Sign In Fast ',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
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
                        controller: _controller.loginusernameController,
                        hintText: 'Username',
                        obscureText: false,
                      ),
                      const SizedBox(height: 10),
                      MyTextField(
                        validator: (value) {
                          if (value!.length < 5) {
                            return 'Password or email is incorrect';
                          }
                          return null;
                        },
                        controller: _controller.loginpasswordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
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
                SignInButton(onTap: () {
                  if (_formkey.currentState!.validate()) {
                    _controller.signInuser(
                        email: _controller.loginusernameController.text.trim(),
                        password:
                            _controller.loginpasswordController.text.trim());
                  }
                }),
                rrheight50,
                rrheight50,
                rrheight50,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () => Get.to(() => RegisterNow()),
                      child: const Text(
                        'Register now',
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
