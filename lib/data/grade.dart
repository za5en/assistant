import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'grade.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class Grade extends HiveObject {
  @HiveField(0)
  String gradeName;

  @HiveField(1)
  String specName;

  @HiveField(2)
  bool isFinished = false;

  @HiveField(3)
  int id;

  @HiveField(4)
  int gradeId;

  factory Grade.fromJson(Map<String, dynamic> json) => _$GradeFromJson(json);
  Map<String, dynamic> toJson() => _$GradeToJson(this);
  Map<String, String> toIosWidgetJson() {
    return {
      'gradeName': gradeName,
      'specName': specName,
      'isFinished': isFinished.toString(),
    };
  }

  Grade({
    required this.gradeName,
    required this.specName,
    required this.isFinished,
    required this.id,
    required this.gradeId,
  });
}
