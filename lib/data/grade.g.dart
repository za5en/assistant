// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GradeAdapter extends TypeAdapter<Grade> {
  @override
  final int typeId = 1;

  @override
  Grade read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Grade(
      gradeName: fields[0] as String,
      specName: fields[1] as String,
      isFinished: fields[2] as bool,
      id: fields[3] as int,
      gradeId: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Grade obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.gradeName)
      ..writeByte(1)
      ..write(obj.specName)
      ..writeByte(2)
      ..write(obj.isFinished)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.gradeId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GradeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Grade _$GradeFromJson(Map<String, dynamic> json) => Grade(
      gradeName: json['gradeName'] as String,
      specName: json['specName'] as String,
      isFinished: json['isFinished'] as bool,
      id: json['id'] as int,
      gradeId: json['gradeId'] as int,
    );

Map<String, dynamic> _$GradeToJson(Grade instance) => <String, dynamic>{
      'gradeName': instance.gradeName,
      'specName': instance.specName,
      'isFinished': instance.isFinished,
      'id': instance.id,
      'gradeId': instance.gradeId,
    };
