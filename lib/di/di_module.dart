import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../api/news_api.dart';

final di = GetIt.instance;

void setUp() {
  di.registerLazySingleton(
      () => Dio(BaseOptions(baseUrl: "https://www.terabayt.uz/")));
  di.registerLazySingleton(() => NewsApi(di.get<Dio>()));
}
