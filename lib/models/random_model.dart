// To parse this JSON data, do
//
//     final random = randomFromJson(jsonString);

import 'dart:convert';

List<Random> randomFromJson(String str) =>
    List<Random>.from(json.decode(str).map((x) => Random.fromJson(x)));

String randomToJson(List<Random> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Random {
  Random({
    required this.title,
    required this.author,
    required this.lines,
    required this.linecount,
  });

  String title;
  String author;
  List<String> lines;
  String linecount;

  factory Random.fromJson(Map<String, dynamic> json) => Random(
        title: json["title"],
        author: json["author"],
        lines: List<String>.from(json["lines"].map((x) => x)),
        linecount: json["linecount"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "author": author,
        "lines": List<dynamic>.from(lines.map((x) => x)),
        "linecount": linecount,
      };
}
