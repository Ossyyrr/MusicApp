import 'package:base/src/models/track_model.dart';

class HitsTrackModel {
  final List<TrackModel> hits;

  const HitsTrackModel({
    required this.hits,
  });

  factory HitsTrackModel.fromJson(Map<String, dynamic> json) {
    final hits = json['hits'] != null && json['hits'].length != 0
        ? json['hits']
            .map<TrackModel>((examType) => TrackModel.fromJson(examType))
            .toList()
        : [];

    return HitsTrackModel(
      hits: hits,
    );
  }
}
