// To parse this JSON data, do
//
//     final categoryData = categoryDataFromJson(jsonString);

import 'dart:convert';

CategoryData categoryDataFromJson(String str) => CategoryData.fromJson(json.decode(str));

String categoryDataToJson(CategoryData data) => json.encode(data.toJson());

class CategoryData {
  CategoryData({
    required this.id,
    required this.name,
    required this.slug,
    this.child,
  });

  int id;
  String name;
  String slug;
  List<CategoryData>? child;

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    child: json["child"] == null ? [] : List<CategoryData>.from(json["child"]!.map((x) => CategoryData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "child": child == null ? [] : List<dynamic>.from(child!.map((x) => x.toJson())),
  };
}
