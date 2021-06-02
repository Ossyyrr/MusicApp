class ImagesModel {
  final String background;
  final String coverart;
  final String coverarthq;
  final String joecolor;

  const ImagesModel({
    required this.background,
    required this.coverart,
    required this.coverarthq,
    required this.joecolor,
  });

  factory ImagesModel.fromJson(Map<String, dynamic> json) {
    return ImagesModel(
      background: json['background']!,
      coverart: json['coverart']!,
      coverarthq: json['coverarthq']!,
      joecolor: json['joecolor']!,
    );
  }
}
