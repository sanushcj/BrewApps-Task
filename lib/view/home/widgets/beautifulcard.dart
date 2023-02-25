import 'package:brewapp_task/controller/home/homescreen.dart';
import 'package:brewapp_task/view/home/myhome.dart';
import 'package:brewapp_task/view/open/fullscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CardWidgetImg extends StatelessWidget {
  const CardWidgetImg({
    super.key,
    required this.url, required this.hdurl,
  });

  final String url;
    final String hdurl;


  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.height;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        HapticFeedback.lightImpact();
        Get.to(() => FullScreenPage(hdImg: hdurl,));
      },
      child: Container(
        height: _w / 2,
        width: _w / 2.28,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.1),
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover)),
      ),
    );
  }
}
