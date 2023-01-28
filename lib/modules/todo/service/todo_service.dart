import 'package:dio/dio.dart';
import 'package:flutter_todo_app/constants/app_constants.dart';
import 'package:flutter_todo_app/modules/todo/model/todo.dart';
import 'package:retrofit/http.dart';

part 'todo_service.g.dart';

@RestApi(baseUrl: AppConstants.DEV_BASE_URL)
abstract class TodoService {
  factory TodoService(Dio dio) = _TodoService;

  @GET('/todos/{id}')
  Future<Todo> getTodo(@Path('id') int id);

  @GET('/todos')
  Future<List<Todo>> getTodos();
}
