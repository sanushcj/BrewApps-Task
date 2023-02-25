// To parse this JSON data, do
//
//     final searchRepo = searchRepoFromJson(jsonString);

import 'dart:convert';

// SearchRepo searchRepoFromJson(String str) =>
//     SearchRepo.fromJson(json.decode(str));

// String searchRepoToJson(SearchRepo data) => json.encode(data.toJson());

// class SearchRepo {
//   SearchRepo({
//     required this.results,
//   });

//   List<Result> results;

//   factory SearchRepo.fromJson(Map<String, dynamic> json) => SearchRepo(
//         results:
//             List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "results": List<dynamic>.from(results.map((x) => x.toJson())),
//       };
// }

class Result {
  Result({
    required this.id,

    // ignore: non_constant_identifier_names
    required this.PreviewPhotoss,
  });

  String id;

  // ignore: non_constant_identifier_names
  List<PreviewPhotos> PreviewPhotoss;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        PreviewPhotoss: List<PreviewPhotos>.from(
            json["preview_photos"].map((x) => PreviewPhotos.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "preview_photos":
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

  Urls urls;

  factory PreviewPhotos.fromJson(Map<String, dynamic> json) => PreviewPhotos(
        urls: Urls.fromJson(json["urls"]),
      );

  Map<String, dynamic> toJson() => {
        "urls": urls.toJson(),
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

  String raw;
  String full;
  String regular;
  String small;
  String thumb;
  String smallS3;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
        smallS3: json["small_s3"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
        "small_s3": smallS3,
      };
}
