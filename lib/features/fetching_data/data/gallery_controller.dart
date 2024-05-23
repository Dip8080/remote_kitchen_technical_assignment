import 'dart:convert';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:remote_kitchen_technical_assignment/features/fetching_data/model/galleryModel.dart';

class GalleryController extends GetxController {
  var isLoading = true.obs;
  var errorMessage = 'fetch error'.obs;
  var galleryData = <GalleryModel>[].obs;

  @override
  void onInit() {
    fetchGalleryData();
    loadGalleryData();
    super.onInit();
  }

  void loadGalleryData() {
    var box = Hive.box<GalleryModel>('gallery');
    galleryData.value = box.values.toList();
  }
  void fetchGalleryData() async {
    try {
      isLoading(true);
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      var data = json.decode(response.body) as List;
      print('this is data in function - ${data}');
      // galleryData.value =
      //     data.map((json) => GalleryModel.fromJson(json)).toList();
      var fetchedData = data.map((json) => GalleryModel.fromJson(json)).toList(); 
      var box = Hive.box<GalleryModel>('gallery');
      await box.clear();
      await box.addAll(fetchedData);

    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading(false);
    }
  }
}
