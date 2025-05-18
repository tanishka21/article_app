import 'dart:convert';
import 'package:get/get.dart';

List<ArticleModel> articleModelFromJson(String str) => List<ArticleModel>.from(
  json.decode(str).map((x) => ArticleModel.fromJson(x)),
);

String articleModelToJson(List<ArticleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArticleModel {
  final int userId;
  final int id;
  final String title;
  final String body;
  RxBool isFavorite = false.obs;

  ArticleModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    bool isFavorite = false,
  }) {
    this.isFavorite.value = isFavorite;
  }

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
    isFavorite: json["isFavorite"] ?? false, // optional safe handling
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
    "isFavorite": isFavorite.value, // serialize properly
  };
}

// import 'dart:convert';

// import 'package:get/get_rx/get_rx.dart';

// List<ArticleModel> articleModelFromJson(String str) => List<ArticleModel>.from(
//   json.decode(str).map((x) => ArticleModel.fromJson(x)),
// );

// String articleModelToJson(List<ArticleModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class ArticleModel {
//   final int userId;
//   final int id;
//   final String title;
//   final String body;
//   RxBool isFavorite;

//   ArticleModel({
//     required this.userId,
//     required this.id,
//     required this.title,
//     required this.body,
//     bool isFavorite = false,
//   }) : isFavorite = isFavorite.obs;

//   factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
//     userId: json["userId"],
//     id: json["id"],
//     title: json["title"],
//     body: json["body"],
//     isFavorite: false,
//   );

//   Map<String, dynamic> toJson() => {
//     "userId": userId,
//     "id": id,
//     "title": title,
//     "body": body,
//   };
// }
