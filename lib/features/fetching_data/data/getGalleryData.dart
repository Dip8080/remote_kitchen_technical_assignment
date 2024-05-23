 import 'dart:convert';

import 'package:remote_kitchen_technical_assignment/features/fetching_data/model/galleryModel.dart';
import 'package:http/http.dart' as http;
Future<List<GalleryModel>> GetGalleryData() async {
  var url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
  final response = await http.get(url, headers: {"Content-Type": "application/json"});
  final List body = json.decode(response.body);
  return body.map((e) => GalleryModel.fromJson(e)).toList();
}