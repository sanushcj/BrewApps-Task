import 'package:brewapp_task/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double heightof = MediaQuery.of(context).size.height;
    double widthof = MediaQuery.of(context).size.height;

    return Container(
      color: premiumYellow,
      height: heightof,
      width: widthof,
    );
  }
}
