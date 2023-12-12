import 'package:hive/hive.dart';

import 'grade.dart';

part 'competency.g.dart';

@HiveType(typeId: 2)
class Competency extends HiveObject {
  @HiveField(0)
  HiveList<Grade>? grades;
}
