import 'package:anon_test/features/main_screen/domain/entity/history_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class HistoryEntityDAO {
  @Query('SELECT * FROM HistoryEntity')
  Future<HistoryEntity?> getHistoryEntity();

  @insert
  Future<void> insertHistoryEntity(HistoryEntity model);


  @delete
  Future<void> deleteHistoryEntity(HistoryEntity model);
}
