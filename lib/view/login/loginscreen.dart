import 'package:brewapp_task/core/colors/colors.dart';
import 'package:brewapp_task/core/const/constants.dart';
import 'package:brewapp_task/view/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/mytextfield.dart';
import 'widgets/signinbutton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});




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
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
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
                SignInButton(onTap: () => signUserIn(),),
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
