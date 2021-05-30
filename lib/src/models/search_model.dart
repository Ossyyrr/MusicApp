import 'package:base/src/models/hits_track_model.dart';

class SearchModel {
  final HitsTrackModel? tracks;

  const SearchModel({
    required this.tracks,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      tracks: json['tracks'] != null
          ? HitsTrackModel.fromJson(json['tracks'])
          : null,
    );
  }
}
