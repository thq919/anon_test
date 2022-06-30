import 'package:anon_test/features/main_screen/domain/entity/history_list_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class HistoryListDAO {
  @Query('SELECT * FROM HistoryListEntity')
  Future<HistoryListEntity?> getHistoryListModel();

  @insert
  Future<void> insertHistoryListModel(HistoryListEntity model);

  
}
