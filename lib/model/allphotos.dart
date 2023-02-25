// To parse this JSON data, do
//
//     final allPhotos = allPhotosFromJson(jsonString);

// To parse this JSON data, do
//
//     final allPhotos = allPhotosFromJson(jsonString);




class AllPhotos {
  AllPhotos({
    required this.urls,
  });

  factory AllPhotos.fromJson(Map<String, dynamic> json) => AllPhotos(
        urls: Urls.fromJson(json['urls']),
      );

  Urls urls;
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
        raw: json['raw'] as String,
        full: json['full'] as String,
        regular: json['regular'] as String,
        small: json['small'] as String,
        thumb: json['thumb'] as String,
        smallS3: json['small_s3'] as String,
      );

  String raw;
  String full;
  String regular;
  String small;
  String thumb;
  String smallS3;
}
