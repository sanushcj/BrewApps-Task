import 'dart:convert';
import 'dart:developer';
import 'package:brewapp_task/controller/home/api_endpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../../model/searchmodel.dart';

class SearchPageController extends GetxController {
  static SearchPageController get instance => Get.find();

  RxList<Result> searchResult = <Result>[].obs;
  RxList<PreviewPhotos> AllsearchResult = <PreviewPhotos>[].obs;

  Future<void> getSearchresults(String query) async {
    var searchurl =
        "https://api.unsplash.com/search/collections?page=1&client_id=$apiendpoint&query=$query";
    var imgReady = await http.get(Uri.parse(searchurl));
    try {
      if (imgReady.statusCode == 200) {
        dynamic sphotos = await jsonDecode(imgReady.body);
        var results = sphotos['results'];
        searchResult.value = List.from(results)
            .map((sitems) => Result.fromJson(sitems))
            .toList();
        AllsearchResult.clear();
//         for (var i = 0; i <= searchResult.length; i++) {
//           if (kDebugMode) {
//             print('${searchResult.length}lengthofresult');
//           }
//           for (var j = 0; j <= searchResult[i].PreviewPhotoss.length; j++) {
//             print('${searchResult[i].PreviewPhotoss.length}lengthofsubb');
// var img$i =  searchResult[i].PreviewPhotoss[j];
//             AllsearchResult.add(img$i);
//           }
//         }
      }
    } catch (e) {
      if (kDebugMode) {
        print('$e heloooo sanushhhhhh');
      }
      Get.snackbar('Sorry an Error Occured', '$e');
    }
  }
}
