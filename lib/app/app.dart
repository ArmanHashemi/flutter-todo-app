import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/settings.dart';
import 'package:flutter_todo_app/constants/app_constants.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';
import 'theme.dart';

final _settings = Get.find<Settings>();

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.APP_TITLE,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _settings.themeStateFromHiveSettingBox,
    );
  }

  @override
  afterFirstLayout(BuildContext context) {}
}
