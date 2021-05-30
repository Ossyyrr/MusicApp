class SongModel {
  final String type;
  final String title;
  final String artist;
  final String url;

  const SongModel({
    required this.type,
    required this.title,
    required this.artist,
    required this.url,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      type: json['type']!,
      title: json['title']!,
      artist: json['subtitle']!,
      url: json['url']!,
    );
  }
}
