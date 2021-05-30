class ArtistModel {
  final String avatar;
  final String id;
  final String name;

  const ArtistModel({
    required this.avatar,
    required this.id,
    required this.name,
  });

  factory ArtistModel.fromJson(Map<String, dynamic> json) {
    return ArtistModel(
      avatar: json['avatar']!,
      id: json['id']!,
      name: json['name']!,
    );
  }
}
