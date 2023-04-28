// To parse this JSON data, do
//
//     final newsData = newsDataFromJson(jsonString);

import 'dart:convert';

NewsData newsDataFromJson(String str) => NewsData.fromJson(json.decode(str));

String newsDataToJson(NewsData data) => json.encode(data.toJson());

class NewsData {
  NewsData({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.content,
    required this.publishedAt,
    required this.updatedAt,
    required this.postId,
    required this.postModified,
    required this.categoryId,
    required this.categoryName,
    required this.image,
    required this.url,
    required this.priority,
    required this.order,
  });

  int id;
  String title;
  String excerpt;
  String content;
  int publishedAt;
  int updatedAt;
  String postId;
  String postModified;
  int? categoryId;
  String categoryName;
  String image;
  String url;
  String priority;
  String order;

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
    id: json["id"],
    title: json["title"],
    excerpt: json["excerpt"],
    content: json["content"],
    publishedAt: json["published_at"],
    updatedAt: json["updated_at"],
    postId: json["post_id"],
    postModified: json["post_modified"],
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    image: json["image"],
    url: json["url"],
    priority: json["priority"],
    order: json["order"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "excerpt": excerpt,
    "content": content,
    "published_at": publishedAt,
    "updated_at": updatedAt,
    "post_id": postId,
    "post_modified": postModified,
    "category_id": categoryId,
    "category_name": categoryName,
    "image": image,
    "url": url,
    "priority": priority,
    "order": order,
  };
}
