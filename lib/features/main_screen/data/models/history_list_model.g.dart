// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryListModel _$HistoryListModelFromJson(Map<String, dynamic> json) =>
    HistoryListModel(
      list: (json['list'] as List<dynamic>)
          .map((e) => HistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int,
    );

Map<String, dynamic> _$HistoryListModelToJson(HistoryListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'list': instance.list,
    };
