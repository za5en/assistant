import 'package:assistant/data/competency.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/grade.dart';

class HiveController {
  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(GradeAdapter());
    Hive.registerAdapter(CompetencyAdapter());
    await Hive.openBox('settings');
    await Hive.openBox('user');
    await Hive.openBox<Grade>('grades');
    await Hive.openBox<Competency>('competencies');
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

  static void newAcc() async {
    await Hive.box('user').delete('name');
    await Hive.box('user').delete('password');
    await Hive.box('user').delete('email');

    var size = Hive.box<Competency>('competencies').length;
    for (var i = size - 1; i >= 0; i--) {
      await Hive.box<Competency>('competencies').deleteAt(i);
    }

    size = Hive.box<Grade>('grades').length;
    for (var i = size - 1; i >= 0; i--) {
      await Hive.box<Grade>('grades').deleteAt(i);
    }
  }
}
