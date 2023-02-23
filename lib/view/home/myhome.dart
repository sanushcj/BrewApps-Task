import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyhomePage extends StatelessWidget {
  const MyhomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: Center(child: SizedBox(width: 200,height: 80, child: CupertinoTextField()),),
    ));
  }
}