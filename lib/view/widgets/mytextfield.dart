import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.validator,
  });
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String? Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextFormField(
          validator: validator,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  )),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 54, 60, 244),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(10),
              ),
              fillColor: Colors.grey.shade200,
              filled: true,
              // labelText: hintText,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[500])),
        ));
  }
}
