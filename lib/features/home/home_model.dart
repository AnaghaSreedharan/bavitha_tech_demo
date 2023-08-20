// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  bool status;
  String message;
  Data data;

  HomeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  String titleId;
  String title;
  String titleRectangularThumbnail;
  String titleSquareThumbnail;
  String authorName;
  String publisherName;
  String voice;
  String voiceArtistInfo;
  String aboutTelugu;
  String aboutEnglish;
  int releaseDate;
  List<RootSourcePath> rootSourcePath;
  int totalChapters;
  String totalDuration;
  String totalSize;
  int price;
  String priceTag;

  Data({
    required this.titleId,
    required this.title,
    required this.titleRectangularThumbnail,
    required this.titleSquareThumbnail,
    required this.authorName,
    required this.publisherName,
    required this.voice,
    required this.voiceArtistInfo,
    required this.aboutTelugu,
    required this.aboutEnglish,
    required this.releaseDate,
    required this.rootSourcePath,
    required this.totalChapters,
    required this.totalDuration,
    required this.totalSize,
    required this.price,
    required this.priceTag,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    titleId: json["titleId"],
    title: json["title"],
    titleRectangularThumbnail: json["titleRectangularThumbnail"],
    titleSquareThumbnail: json["titleSquareThumbnail"],
    authorName: json["authorName"],
    publisherName: json["publisherName"],
    voice: json["voice"],
    voiceArtistInfo: json["voiceArtistInfo"],
    aboutTelugu: json["aboutTelugu"],
    aboutEnglish: json["aboutEnglish"],
    releaseDate: json["releaseDate"],
    rootSourcePath: List<RootSourcePath>.from(json["rootSourcePath"].map((x) => RootSourcePath.fromJson(x))),
    totalChapters: json["totalChapters"],
    totalDuration: json["totalDuration"],
    totalSize: json["totalSize"],
    price: json["price"],
    priceTag: json["priceTag"],
  );

  Map<String, dynamic> toJson() => {
    "titleId": titleId,
    "title": title,
    "titleRectangularThumbnail": titleRectangularThumbnail,
    "titleSquareThumbnail": titleSquareThumbnail,
    "authorName": authorName,
    "publisherName": publisherName,
    "voice": voice,
    "voiceArtistInfo": voiceArtistInfo,
    "aboutTelugu": aboutTelugu,
    "aboutEnglish": aboutEnglish,
    "releaseDate": releaseDate,
    "rootSourcePath": List<dynamic>.from(rootSourcePath.map((x) => x.toJson())),
    "totalChapters": totalChapters,
    "totalDuration": totalDuration,
    "totalSize": totalSize,
    "price": price,
    "priceTag": priceTag,
  };
}

class RootSourcePath {
  int duration;
  String chapterName;
  int size;
  String audio;
  int min;
  String sec;

  RootSourcePath({
    required this.duration,
    required this.chapterName,
    required this.size,
    required this.audio,
    required this.min,
    required this.sec,
  });

  factory RootSourcePath.fromJson(Map<String, dynamic> json) => RootSourcePath(
    duration: json["duration"],
    chapterName: json["chapterName"],
    size: json["size"],
    audio: json["audio"],
    min: json["min"],
    sec: json["sec"],
  );

  Map<String, dynamic> toJson() => {
    "duration": duration,
    "chapterName": chapterName,
    "size": size,
    "audio": audio,
    "min": min,
    "sec": sec,
  };
}
