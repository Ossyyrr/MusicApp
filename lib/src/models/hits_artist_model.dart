import 'package:base/src/models/artist_model.dart';

class HitsArtistModel {
  final List<ArtistModel> hits;

  const HitsArtistModel({
    required this.hits,
  });

  factory HitsArtistModel.fromJson(Map<String, dynamic> json) {
    return HitsArtistModel(
      hits: json['hits']!,
    );
  }
}
