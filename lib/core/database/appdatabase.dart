import 'dart:async';

import 'package:anon_test/features/main_screen/data/datasource/history_list_dao.dart';
import 'package:anon_test/features/main_screen/data/datasource/history_model_dao.dart';
import 'package:anon_test/features/main_screen/domain/entity/history_entity.dart';
import 'package:anon_test/features/main_screen/domain/entity/history_list_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';

part 'appdatabase.g.dart';

@Database(version: 1, entities: [HistoryListEntity, HistoryEntity])
abstract class AppDatabase extends FloorDatabase {
  HistoryListDAO get historyListDao;
  HistoryEntityDAO get historyEntityDAO;
}
