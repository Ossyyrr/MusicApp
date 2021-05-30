import 'package:base/src/models/song_model.dart';

class TrackModel {
  final SongModel track;

  const TrackModel({
    required this.track,
  });

  factory TrackModel.fromJson(Map<String, dynamic> json) {
    return TrackModel(
      track: SongModel.fromJson(json['track']!),
    );
  }
}
