import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/app.dart';
import 'package:flutter_todo_app/core/di/injection.dart';

import 'core/persist/persist_storage.dart';

Future<void> main() async {
  await loadPersistStorage();
  await loadInjections();
  runApp(const App());
}
