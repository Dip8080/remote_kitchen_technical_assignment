
import 'package:hive/hive.dart';

part 'galleryModel.g.dart';
@HiveType(typeId: 0)
class GalleryModel extends HiveObject{
  @HiveField(0)
  final int ? albumid;
  @HiveField(1)
  final int ? id;
  @HiveField(2)
  final String ? title ;
  @HiveField(3)
  final String ? url;
  @HiveField(4)
  final String ? thumbnailUrl;
 GalleryModel({this.albumid , this.id , this.title , this.url , this.thumbnailUrl});

  factory GalleryModel.fromJson(Map<String , dynamic> json) {
    return GalleryModel(
      albumid: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }

}