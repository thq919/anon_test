// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryModel _$HistoryModelFromJson(Map<String, dynamic> json) => HistoryModel(
      pathtToFile: json['pathtToFile'] as String,
      whenCreated: DateTime.parse(json['whenCreated'] as String),
      id: json['id'] as int,
    );

Map<String, dynamic> _$HistoryModelToJson(HistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'whenCreated': instance.whenCreated.toIso8601String(),
      'pathtToFile': instance.pathtToFile,
    };
