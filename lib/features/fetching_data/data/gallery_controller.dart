import 'dart:convert';
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:remote_kitchen_technical_assignment/features/fetching_data/model/galleryModel.dart';

class GalleryController extends GetxController {
  var isLoading = true.obs;
  var errorMessage = 'fetch error'.obs;
  var galleryData = <GalleryModel>[].obs;

  @override
  void onInit() {
    fetchGalleryData();
    super.onInit();
  }

  void fetchGalleryData() async {
    try {
      isLoading(true);
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      var data = json.decode(response.body);
      galleryData.value =
          data.map((json) => GalleryModel.fromJson(json)).toList();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading(false);
    }
  }
}
