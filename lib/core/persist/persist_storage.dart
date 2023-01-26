import 'package:hive_flutter/hive_flutter.dart';

import '../../constants/app_constants.dart';

Future<void> loadPersistStorage() async {
  await Hive.initFlutter();
  await Hive.openBox(AppConstants.SETTINGS_BOX_NAME);
  print('persistent storages loaded');
}
