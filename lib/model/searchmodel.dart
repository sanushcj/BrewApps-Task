import 'dart:convert';

import 'package:flutter/material.dart';

SearchPhotos searchPhotosFromJson(String str) =>
    SearchPhotos.fromJson(json.decode(str));

String searchPhotosToJson(SearchPhotos data) => json.encode(data.toJson());

class SearchPhotos {
  SearchPhotos({
    required this.results,
  });

  List<Result> results;

  factory SearchPhotos.fromJson(Map<String, dynamic> json) => SearchPhotos(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.description,
    required this.previewPhotos,
  });

  dynamic description;
  List<PreviewPhoto> previewPhotos;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        description: json["description"],
        previewPhotos: List<PreviewPhoto>.from(
            json["preview_photos"].map((x) => PreviewPhoto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "preview_photos":
            List<dynamic>.from(previewPhotos.map((x) => x.toJson())),
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

class PreviewPhoto {
  PreviewPhoto({
    required this.urls,
  });

  Urls urls;

  factory PreviewPhoto.fromJson(Map<String, dynamic> json) => PreviewPhoto(
        urls: Urls.fromJson(json["urls"]),
      );

  Map<String, dynamic> toJson() => {
        "urls": urls.toJson(),
      };
}
