import 'dart:ui';
import 'package:brewapp_task/controller/home/homescreen.dart';
import 'package:brewapp_task/controller/search/searchscreencontroller.dart';
import 'package:brewapp_task/core/colors/colors.dart';
import 'package:brewapp_task/view/home/widgets/beautifulcard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// class MySearchPage extends StatelessWidget {
//   const MyhomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  SafeArea(child: Scaffold(
//       body: Column(
//         children: [
//           const Center(child: SizedBox(width:double.infinity,height: 80, child: CupertinoTextField()),),
//           ElevatedButton(onPressed:() =>  AuthenticationRepo.instance.logout(), child: const Text('logout'))
//         ],
//       ),

//     ));
//   }
// }

class MySearchPage extends StatefulWidget {
  const MySearchPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MySearchPageState createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage>
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

  var cupertinoController = TextEditingController().obs;

  @override
  Widget build(BuildContext context) {
    SearchPageController searchController = Get.put(SearchPageController());
    // ignore: no_leading_underscores_for_local_identifiers
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: false,
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
                ' Search your Image hear',
                style: TextStyle(
                  fontSize: _w / 17,
                  color: Colors.white.withOpacity(.7),
                  fontWeight: FontWeight.w400,
                ),
              ),
              systemOverlayStyle: SystemUiOverlayStyle.light,
            ),
          ),
        ),
      ),
      backgroundColor: premiumcolor,
      body: Column(
        children: [
          // SizedBox(height: _w / 13),/

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: 54,
                child: CupertinoSearchTextField(
                  controller: cupertinoController.value,
                  onSubmitted: searchController.getSearchresults,
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                )),
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

                    //  }
                    itemBuilder: (context, index) => CardWidgetImg(
                          hdurl: searchController.searchResult[index]
                              .PreviewPhotoss[0].urls.regular,
                          url: searchController
                              .searchResult[index].PreviewPhotoss[0].urls.small,
                        ),
                    itemCount: searchController.searchResult.length),
              ),
            ),
          )
        ],
      ),
    );
  }
// margin: EdgeInsets.fromLTRB(_w / 25, _w / 25, _w / 25, 0),
}
