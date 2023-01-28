import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants/app_constants.dart';
import 'package:flutter_todo_app/modules/todo/controller/todo_controller.dart';
import 'package:get/get.dart';

final _controller = Get.find<TodoController>();

class TodoView extends GetView {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppConstants.APP_TITLE,
            style: themeData.textTheme.headline1,
          ),
          centerTitle: true,
        ),
        body: const Text('todo page'));
  }
}
