import 'package:get/get.dart';

import '../modules/home/home_view.dart';
import '../modules/todo/view/todo_view.dart';

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
