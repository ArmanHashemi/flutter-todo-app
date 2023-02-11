import 'package:dio/dio.dart';
import 'package:flutter_todo_app/app/settings.dart';
import 'package:get/get.dart';

final _settings = Get.find<Settings>();

class DioTokenInterceptor extends Interceptor {
  final Dio dio;
  DioTokenInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }
}
