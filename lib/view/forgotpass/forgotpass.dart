import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/authentication/forgotpass/forgotpasswordcontroller.dart';
import '../../core/colors/colors.dart';
import '../../core/const/constants.dart';
import '../widgets/mytextfield.dart';
import '../widgets/signinbutton.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  final ForgotPasswordController _controller = Get.put(ForgotPasswordController());
  final GlobalKey<FormState> _myformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[250],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Enter your Email Address',
              style: TextStyle(color: premiumBlack, fontSize: 20)),
          rrheight20,
          Form(
            key: _myformkey,
            child: MyTextField(
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
              controller: _controller.forgotpassController,
              hintText: 'email',
              obscureText: false,
            ),
          ),
          rrheight50,
          SignInButton(
            onTap: () {
              if (_myformkey.currentState!.validate()) {
                _controller.resetUserPassword(
                  email: _controller.forgotpassController.text.trim(),
                );
              }
            },
            colorbutton: const Color.fromARGB(255, 149, 117, 205),
            title: 'Reset Password',
          )
        ],
      ),
    );
  }
}
