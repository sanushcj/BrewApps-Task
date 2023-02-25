

class Result {
  Result({
    required this.id,

    required this.PreviewPhotoss,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'],
        PreviewPhotoss: List<PreviewPhotos>.from(
            json['preview_photos'].map((x) => PreviewPhotos.fromJson(x))),
      );

  String id;

  List<PreviewPhotos> PreviewPhotoss;

  Map<String, dynamic> toJson() => {
        'id': id,
        'preview_photos':
            List<dynamic>.from(PreviewPhotoss.map((x) => x.toJson())),
      };
}
// To parse this JSON data, do
//
//     final previewPhotos = previewPhotosFromJson(jsonString);

class PreviewPhotos {
  PreviewPhotos({
    required this.urls,
  });

  factory PreviewPhotos.fromJson(Map<String, dynamic> json) => PreviewPhotos(
        urls: Urls.fromJson(json['urls']),
      );

  Urls urls;

  Map<String, dynamic> toJson() => <String, dynamic> {
        'urls': urls.toJson(),
      };
}

class Urls {
  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json['raw'],
        full: json['full'],
        regular: json['regular'],
        small: json['small'],
        thumb: json['thumb'],
        smallS3: json['small_s3'],
      );

  String raw;
  String full;
  String regular;
  String small;
  String thumb;
  String smallS3;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'raw': raw,
        'full': full,
        'regular': regular,
        'small': small,
        'thumb': thumb,
        'small_s3': smallS3,
      };
}
