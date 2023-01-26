import 'package:get/get.dart';

import '../../app/settings.dart';
import '../../home/home_controller.dart';

Future<void> loadInjections() async {
  Get.put(Settings());
  Get.lazyPut(() => HomeController());
  print('Injections loaded');
}
