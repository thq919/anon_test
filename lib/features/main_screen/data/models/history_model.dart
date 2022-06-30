
import 'package:anon_test/features/main_screen/domain/entity/history_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'history_model.g.dart';

@JsonSerializable()
class HistoryModel extends HistoryEntity {
  HistoryModel({required String pathtToFile, required DateTime whenCreated, required int id}) : super(pathtToFile: pathtToFile, whenCreated: whenCreated, id: id);

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryModelToJson(this);
}


