import 'package:brewapp_task/controller/authentication/auth%20repository/authrepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyhomePage extends StatelessWidget {
  const MyhomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body: Column(
        children: [
          Center(child: SizedBox(width: 200,height: 80, child: CupertinoTextField()),),
          ElevatedButton(onPressed:() =>  AuthenticationRepo.instance.logout(), child: const Text('logout'))
        ],
      ),

    ));
  }
}