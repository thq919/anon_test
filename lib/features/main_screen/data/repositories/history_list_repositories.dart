
import 'package:anon_test/core/errors/failure.dart';
import 'package:anon_test/features/main_screen/data/datasource/history_list_dao.dart';
import 'package:anon_test/features/main_screen/data/datasource/history_model_dao.dart';
import 'package:anon_test/features/main_screen/domain/entity/history_list_entity.dart';
import 'package:anon_test/features/main_screen/domain/repositores/history_list_repositories.dart';
import 'package:dartz/dartz.dart';

class HistoryListRepositoriesImpl implements HistoryListRepositories {
  final HistoryListDAO daoFullModel;
  final HistoryEntityDAO daoSingleStory;
  HistoryListRepositoriesImpl(this.daoFullModel, this.daoSingleStory);

  @override
  Future<Either<Failure, HistoryListEntity?>> getAllHistories() async {
    return await _getAllHistories(() {
      return daoFullModel.getHistoryListModel();
    });
  }

  Future<Either<Failure, HistoryListEntity?>> _getAllHistories(
      Future<HistoryListEntity?> Function() getCartOfUser) async {
    try {
      return Right(await daoFullModel.getHistoryListModel());
    } on DatabaseFailure catch(e){
      return Left(
          DatabaseFailure('ошибка в бд history_list_repositories:25, errmsg: $e'));
    } 
  }
}
