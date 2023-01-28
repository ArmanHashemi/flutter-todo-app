import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter_todo_app/core/http_client/dio_log_interceptor.dart';

import '../../constants/app_constants.dart';

final cacheOptions = CacheOptions(
  store: HiveCacheStore(null, hiveBoxName: AppConstants.CHACHE_BOX_NAME),
);

Dio dio = dioClient();

Dio dioClient() {
  final dio = Dio(BaseOptions(
    connectTimeout: 6000,
    receiveTimeout: 6000,
  ));

  dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
  dio.interceptors.add(DioLogInterceptor());

  return dio;
}
