import 'package:flutter_todo_app/modules/todo/model/todo.dart';
import 'package:flutter_todo_app/modules/todo/service/todo_service.dart';
import 'package:get/get.dart';

class TodoController extends GetxController with StateMixin<List<Todo>> {
  final _todoService = Get.find<TodoService>();

  var todo = Todo().obs;
  var todos = <Todo>[].obs;

  Future<void> _getTodo() async {
    try {
      final response = await _todoService.getTodo(1);
      todo.value = response;
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _getTodos() async {
    _todoService.getTodos().then(
        (todos) => change(todos, status: RxStatus.success()), onError: (err) {
      change(null, status: RxStatus.error(err));
    });
  }

  @override
  void onInit() {
    _getTodo();
    _getTodos();
    super.onInit();
  }
}
