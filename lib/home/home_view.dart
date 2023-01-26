import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants/app_constants.dart';
import 'package:flutter_todo_app/home/home_controller.dart';
import 'package:get/get.dart';

final _controller = Get.find<HomeController>();

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller.animationController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.animationController.value * 1,
                  child: child,
                );
              },
              child: Icon(
                _controller.isDarkMode.value
                    ? Icons.dark_mode
                    : Icons.light_mode,
                size: 100,
              ),
            ),
            SizedBox(
              height: 50,
              child: Center(
                child: AnimatedDefaultTextStyle(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 500),
                    style: TextStyle(
                      fontSize: _controller.fontSize,
                      color: _controller.textColor,
                      fontWeight: FontWeight.w900,
                    ),
                    child:
                        Text(_controller.currentModeName.value.toUpperCase())),
              ),
            ),
            const SizedBox(height: 20),
            Switch(
              value: _controller.isDarkMode.value,
              onChanged: (bool val) {
                _controller.toggleTheme();
                Get.snackbar(
                  '',
                  '',
                  maxWidth: 300,
                  titleText: Text(
                    'App Theme Changed',
                    textAlign: TextAlign.center,
                    style: themeData.textTheme.bodyText1,
                  ),
                  messageText: Text(
                    'to ${_controller.currentModeName.value.toUpperCase()}',
                    textAlign: TextAlign.center,
                    style: themeData.textTheme.bodyText1,
                  ),
                  snackStyle: SnackStyle.FLOATING,
                  // maxWidth: 150,
                  mainButton: TextButton(
                    style: TextButton.styleFrom(primary: Colors.black),
                    onPressed: () {
                      _controller.changeAppTheme();
                      Get.back();
                    },
                    child: Text(
                      'Revert',
                      textAlign: TextAlign.center,
                      style: themeData.textTheme.button,
                    ),
                  ),
                  backgroundColor: _controller.isDarkMode.value
                      ? Colors.white
                      : Colors.black,
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
            ),
            const SizedBox(height: 2),
          ],
        ),
      ),
    );
  }
}
