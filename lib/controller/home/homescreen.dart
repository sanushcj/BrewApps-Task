import 'dart:convert';
import 'package:brewapp_task/controller/home/api_endpoints.dart';
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

  getphotos() async {
    var allPhotos =
        'https://api.unsplash.com/photos?per_page=35&client_id=$apiendpoint';
    var imgReady = await http.get(Uri.parse(allPhotos));
    try {
      if (imgReady.statusCode == 200) {
        List<dynamic> photos = jsonDecode(imgReady.body);

        listofRandomPhotos.value =
            photos.map((item) => AllPhotos.fromJson(item)).toList();
      }
    } catch (e) {
      Get.snackbar('Sorry an Error Occured', '$e');
    }
  }
}