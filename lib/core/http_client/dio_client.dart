import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter_todo_app/constants/app_constants.dart';
import 'package:flutter_todo_app/core/http_client/dio_error_interceptor.dart';
import 'package:flutter_todo_app/core/http_client/dio_log_interceptor.dart';
import 'package:flutter_todo_app/core/http_client/dio_token_interceptor.dart';

final cacheOptions = CacheOptions(
  store: HiveCacheStore(null, hiveBoxName: AppConstants.CHACHE_BOX_NAME),
);

Dio dio = dioClient();

Dio dioClient() {
  final dio = Dio(BaseOptions(
    receiveTimeout: 15000, // 15 seconds
    connectTimeout: 15000,
    sendTimeout: 15000,
  ));

  dio.interceptors.addAll([
    DioTokenInterceptor(dio),
    DioCacheInterceptor(options: cacheOptions),
    DioLogInterceptor(),
    DioErrorInterceptor()
  ]);

  return dio;
}
