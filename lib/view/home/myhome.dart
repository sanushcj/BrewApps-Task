import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controller/home/homescreen.dart';
import '../../core/colors/colors.dart';
import '../../core/const/constants.dart';
import '../logout/logout.dart';
import '../search/searchdelegate.dart';
import 'widgets/beautifulcard.dart';

class MyhomePage extends StatefulWidget {
  const MyhomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyhomePageState createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: 0, end: -30)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   final AllPhotosController controller = Get.put(AllPhotosController());
    // ignore: no_leading_underscores_for_local_identifiers
   final double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(20)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AppBar(
              backgroundColor: Colors.white.withOpacity(.05),
              elevation: 0,
              title: Text(
                ' BREW APP IMAGES',
                style: TextStyle(
                  fontSize: _w / 17,
                  color: Colors.white.withOpacity(.7),
                  fontWeight: FontWeight.w400,
                ),
              ),
              actions: <Widget>[
                IconButton(
                  tooltip: 'Settings',
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(Icons.people, color: Colors.white.withOpacity(.7)),
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    Get.to(() => LogOutScreen());
                  },
                ),
              ],
              systemOverlayStyle: SystemUiOverlayStyle.light,
            ),
          ),
        ),
      ),
      backgroundColor: premiumcolor,
      body: Column(
        children: <Widget>[
          // SizedBox(height: _w / 13),/

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: GestureDetector(
                onTap: () => Get.to(() => const MySearchPage()),
                child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: const <Widget>[
                        Icon(Icons.search),
                        rrwidth20,
                        Text('Search your Image')
                      ],
                    )),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => GridView.builder(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemBuilder: (BuildContext context, int index) =>
                        //  for (var i = 0; i < count; i++) {

                        CardWidgetImg(
                            hdurl: controller
                                .listofRandomPhotos[index].urls.regular,
                            url: controller
                                .listofRandomPhotos[index].urls.small),
                    itemCount: controller.listofRandomPhotos.length),
              ),
            ),
          )
        ],
      ),
    );
  }
// margin: EdgeInsets.fromLTRB(_w / 25, _w / 25, _w / 25, 0),
}
