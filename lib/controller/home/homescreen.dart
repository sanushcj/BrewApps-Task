import 'dart:convert';
import 'dart:developer';
import 'package:brewapp_task/model/searchmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:brewapp_task/model/allphotos.dart';
import 'package:get/get.dart';

class AllPhotosController extends GetxController {
  static AllPhotosController get instance => Get.find();

  @override
  void onInit() {
    getphotos();
    super.onInit();
  }

  RxList<AllPhotos> listofRandomPhotos = <AllPhotos>[].obs;
  RxList<SearchPhotos> searchResult = <SearchPhotos>[].obs;

  getphotos() async {
    var allPhotos =
        'https://api.unsplash.com/photos?per_page=30&client_id=CcpTYnSLHfdXQoyEx58HrRs_-lHX1LZ4XkCSEzGzDSs';
    var imgReady = await http.get(Uri.parse(allPhotos));
    try {
      if (imgReady.statusCode == 200) {
        List<dynamic> photos = jsonDecode(imgReady.body);
        print('$photos');

        listofRandomPhotos.value =
            photos.map((item) => AllPhotos.fromJson(item)).toList();
      }
    } catch (e) {
      print('$e heloooo sanushhhhhh');
      Get.snackbar('Sorry an Error Occured', '$e');
    }
  }

  Future<void> getSearchresults(String query) async {
    if (query.length <= 1) {
    } else {
      var searchurl =
          "https://api.unsplash.com/search/collections?page=1&client_id=CcpTYnSLHfdXQoyEx58HrRs_-lHX1LZ4XkCSEzGzDSs&query=$query";
      var imgReady = await http.get(Uri.parse(searchurl));
      try {
        if (imgReady.statusCode == 200) {
          dynamic sphotos = await jsonDecode(imgReady.body);
          log('${query.toString()} this is queryyyy');
          log('${sphotos.toString()} this is photosssss');

          searchResult.value = List.from(sphotos)
              .map((sitems) => SearchPhotos.fromJson(sitems))
              .toList();
        }
      } catch (e) {
        if (kDebugMode) {
          print('$e heloooo sanushhhhhh');
        }
        Get.snackbar('Sorry an Error Occured', '$e');
      }
    }
  }
}
