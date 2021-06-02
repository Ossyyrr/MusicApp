import 'package:base/src/models/images_model.dart';

class SongModel {
  final String type;
  final String title;
  final String artist;
  final String url;
  final ImagesModel images;

  const SongModel({
    required this.type,
    required this.title,
    required this.artist,
    required this.url,
    required this.images,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      type: json['type']!,
      title: json['title']!,
      artist: json['subtitle']!,
      url: json['url']!,
      images: ImagesModel.fromJson(json['images']!),
    );
  }
}
