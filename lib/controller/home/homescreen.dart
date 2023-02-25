import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../model/allphotos.dart';
import 'api_endpoints.dart';

class AllPhotosController extends GetxController {
  static AllPhotosController get instance => Get.find();

  @override
  void onInit() {
    getphotos();
    super.onInit();
  }

  RxList<AllPhotos> listofRandomPhotos = <AllPhotos>[].obs;

  Future<void>getphotos() async {
  const  String allPhotos =
        'https://api.unsplash.com/photos?per_page=35&client_id=$apiendpoint';
   final http.Response imgReady = await http.get(Uri.parse(allPhotos));
    try {
      if (imgReady.statusCode == 200) {
     final   List<dynamic> photos = jsonDecode(imgReady.body);

        listofRandomPhotos.value =
            photos.map((dynamic item) => AllPhotos.fromJson(item)).toList();
      }
    } catch (e) {
      Get.snackbar('Sorry an Error Occured', '$e');
    }
  }
}
