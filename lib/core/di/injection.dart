import 'package:flutter_todo_app/app/settings.dart';
import 'package:flutter_todo_app/core/http_client/dio_client.dart';
import 'package:flutter_todo_app/modules/home/controller/home_controller.dart';
import 'package:flutter_todo_app/modules/todo/controller/todo_controller.dart';
import 'package:flutter_todo_app/modules/todo/service/todo_service.dart';
import 'package:get/get.dart';

Future<void> loadInjections() async {
  Get.put(Settings());
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => TodoController());
  Get.lazyPut(() => TodoService(dio));
  print('Injections loaded');
}
