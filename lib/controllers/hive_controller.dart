import 'package:hive_flutter/hive_flutter.dart';

class HiveController {
  static Future<void> initHive() async {
    await Hive.initFlutter();
    await Hive.openBox('settings');
    await Hive.openBox('user');
  }

  static Future<void> logout() async {
    var size = Hive.box('settings').length;
    var tmp = Hive.box('settings').get('color_theme');
    for (var i = size - 1; i >= 0; i--) {
      await Hive.box('settings').deleteAt(i);
    }
    await Hive.box('settings').put('color_theme', tmp);
    await Hive.box('settings').put('initial_screen', '/registration');
  }

  static void newAcc() async {}
}
