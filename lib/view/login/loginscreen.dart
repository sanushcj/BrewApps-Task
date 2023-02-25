import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/authentication/login/logincontroller.dart';
import '../../core/colors/colors.dart';
import '../../core/const/constants.dart';
import '../forgotpass/forgotpass.dart';
import '../signup/signup.dart';
import '../widgets/mytextfield.dart';
import '../widgets/signinbutton.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController _controller = Get.put(LoginController());
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: premiumGrey,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                rrheight50,
                const SizedBox(
                    height: 100,
                    width: 200,
                    child: Icon(Icons.military_tech,size: 100,),
                    // child: Image.asset(
                    //   'assets/imgs/cropped-Logo1-156x80.png',
                    //   fit: BoxFit.fill,
                    // )
                    ),
                rrheight50,
                Text(
                  'Welcome back 🤩  ',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 35,fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 25),
                Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      MyTextField(
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'please Enter your Email';
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return 'please enter valid email';
                          }
                          return null;
                        },
                        controller: _controller.loginusernameController,
                        hintText: 'email',
                        obscureText: false,
                      ),
                      const SizedBox(height: 10),
                      MyTextField(
                        validator: (String? value) {
                            if (value!.isEmpty) {
                            return 'Please enter your Password';
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
                    children: <Widget>[
                      GestureDetector(
                  onTap: () => Get.to(()=>  ForgotPasswordPage()),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.blue[600]),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                SignInButton(colorbutton: const Color.fromARGB(255, 149, 117, 205),title: 'Log In',
                  onTap: () {
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
                  children: <Widget>[
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
