import 'package:anon_test/core/errors/failure.dart';
import 'package:anon_test/features/main_screen/domain/entity/history_list_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HistoryListRepositories {
  Future<Either<Failure, HistoryListEntity?>> getAllHistories();
}
