import 'dart:convert';

import 'package:anon_test/features/main_screen/data/models/history_model.dart';
import 'package:floor/floor.dart';

@Entity()
@TypeConverters([ListHistoryModelConverter])
class HistoryListEntity {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final List<HistoryModel> list;

  HistoryListEntity({required this.id, required this.list});
}

class ListHistoryModelConverter extends TypeConverter<List<HistoryModel>, String> {
  @override
  List<HistoryModel> decode(String databaseValue) {
    // лист проверить надо
    List<HistoryModel> historyModel = List.from(
        (jsonDecode(databaseValue).map((i) => HistoryModel.fromJson(i))));
    return historyModel;
  }

  @override
  String encode(List<HistoryModel> value) {
    return jsonEncode(value);
  }
}
