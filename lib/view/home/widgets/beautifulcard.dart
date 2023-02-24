import 'package:brewapp_task/controller/home/homescreen.dart';
import 'package:brewapp_task/view/home/myhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CardWidgetImg extends StatelessWidget {
  const CardWidgetImg({
    super.key,
    required this.indexoftheImg,
  });

  final int indexoftheImg;

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.height;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        HapticFeedback.lightImpact();
        Get.to(() => RouteWhereYouGo2());
      },
      child: Container(
        height: _w / 2,
        width: _w / 2.28,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.1),
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(AllPhotosController
                    .instance.listofRandomPhotos[indexoftheImg].urls.full.toString()),
                fit: BoxFit.cover)),
      ),
    );
  }
}
