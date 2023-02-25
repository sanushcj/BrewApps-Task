import 'package:brewapp_task/controller/authentication/auth%20repository/authrepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

class LogOutScreen extends StatefulWidget {
  @override
  _LogOutScreenState createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: -30, end: 0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// ListView
          ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(_w / 17, _w / 20, 0, _w / 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BrewApps ❤️',
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.black.withOpacity(.8),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: _w / 35),
                    Text(
                      'Keep Smiling have a nice day!',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black.withOpacity(.5),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              SizedBox(height: _w / 20),
            ],
          ),

          /// SETTING ICON
          Align(
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, _w / 9.5, _w / 15, 0),
                child: Container(
                    width: 150,
                    height: 80,
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          AuthenticationRepo.instance.logout();
                        },
                        icon: const Icon(Icons.logout_rounded),
                        label: const Text('Logout')))),
          ),
          const Align(alignment: Alignment.bottomCenter, child: Text('SanushCJ'),),
        ],
      ),
    );

    // Blur the Status bar
  }
}
