import 'package:flutter_todo_app/modules/home/view/home_view.dart';
import 'package:flutter_todo_app/modules/todo/view/todo_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
    ),
    GetPage(
      name: _Paths.TODO,
      page: () => const TodoView(),
    ),
  ];
}
