import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../model/searchmodel.dart';
import '../home/api_endpoints.dart';

class SearchPageController extends GetxController {
  static SearchPageController get instance => Get.find();

  RxList<Result> searchResult = <Result>[].obs;
  RxList<PreviewPhotos> allsearchResult = <PreviewPhotos>[].obs;

  Future<void> getSearchresults(String query) async {
   final String searchurl =
        'https://api.unsplash.com/search/collections?page=1&client_id=$apiendpoint&query=$query';
  final  http.Response imgReady = await http.get(Uri.parse(searchurl));
    try {
      if (imgReady.statusCode == 200) {
     final   dynamic sphotos = await jsonDecode(imgReady.body);
        final results = sphotos['results'];
        searchResult.value = List.from(results)
            .map((sitems) => Result.fromJson(sitems))
            .toList();
        allsearchResult.clear();
//         for (var i = 0; i <= searchResult.length; i++) {
//           if (kDebugMode) {
//             print('${searchResult.length}lengthofresult');
//           }
//           for (var j = 0; j <= searchResult[i].PreviewPhotoss.length; j++) {
//             print('${searchResult[i].PreviewPhotoss.length}lengthofsubb');
// var img$i =  searchResult[i].PreviewPhotoss[j];
//             allsearchResult.add(img$i);
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
