import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../open/fullscreen.dart';

class CardWidgetImg extends StatelessWidget {
  const CardWidgetImg({
    super.key,
    required this.url, required this.hdurl,
  });

  final String url;
    final String hdurl;


  @override
  Widget build(BuildContext context) {
   final double w = MediaQuery.of(context).size.height;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        HapticFeedback.lightImpact();
        Get.to(() => FullScreenPage(hdImg: hdurl,));
      },
      child: Container(
        height: w / 2,
        width: w / 2.28,
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
