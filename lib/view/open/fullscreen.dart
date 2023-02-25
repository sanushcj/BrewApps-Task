import 'package:brewapp_task/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FullScreenPage extends StatelessWidget {
  const FullScreenPage({super.key, required this.hdImg});
  final String hdImg;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text('EXAMPLE  PAGE',
            style: TextStyle(
                color: Colors.black.withOpacity(.7),
                fontWeight: FontWeight.w600,
                letterSpacing: 1)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black.withOpacity(.8)),
          onPressed: () => Navigator.maybePop(context),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      backgroundColor: premiumBlack,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration:
            BoxDecoration(image: DecorationImage(image: NetworkImage(hdImg))),
      ),
    );
  }
}
