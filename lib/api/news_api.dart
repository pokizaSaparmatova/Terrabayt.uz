import 'package:dio/dio.dart';
import 'package:terrabayt_uz/data/models/category_data.dart';
import 'package:terrabayt_uz/data/models/news_data.dart';

class NewsApi {
  final Dio _dio;

  NewsApi(this._dio);

  Future<List<CategoryData>> getCategories() async {
    final response =
        await _dio.get("api.php", queryParameters: {"action": "categories"});
    print("Code ${response.statusCode}");
    return (response.data as List)
        .map((e) => CategoryData.fromJson(e))
        .toList();
  }

  Future<List<NewsData>> getPost(int categoryId, int time) async {
    print("Cat: $categoryId time: $time");
    final response = await _dio.get("api.php", queryParameters: {
      "action": "posts",
      "first_update": time,
      "category": categoryId,
      "limit": 15
    });
    print("News Code ${response.statusCode}");
    print("News response ${response.data}");
    return (response.data as List).map((e) => NewsData.fromJson(e)).toList();
  }
}
