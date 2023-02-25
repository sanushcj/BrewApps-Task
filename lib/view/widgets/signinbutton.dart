import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton(
      {super.key,
      required this.onTap,
      required this.colorbutton,
      required this.title});
  final Function() onTap;
  final Color colorbutton;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: colorbutton,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
