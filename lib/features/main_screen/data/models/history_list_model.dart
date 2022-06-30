
import 'package:anon_test/features/main_screen/domain/entity/history_list_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'history_model.dart';

part 'history_list_model.g.dart';


@JsonSerializable()
class HistoryListModel extends HistoryListEntity {
  HistoryListModel({required List<HistoryModel> list, required int id}) : super(list: list, id: id);

  factory HistoryListModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryListModelFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryListModelToJson(this);
}


