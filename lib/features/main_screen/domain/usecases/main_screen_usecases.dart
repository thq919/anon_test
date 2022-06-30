import 'package:anon_test/core/errors/failure.dart';
import 'package:anon_test/core/usecases/usecases.dart';
import 'package:anon_test/features/main_screen/domain/entity/history_list_entity.dart';
import 'package:anon_test/features/main_screen/domain/repositores/history_list_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class MainScreenUseCases extends UseCases<HistoryListEntity, MainScreenParams> {
  final HistoryListRepositories repositories;
  MainScreenParams? params;

  MainScreenUseCases(this.repositories, [this.params]);
  @override
  Future<Either<Failure, HistoryListEntity?>> call([MainScreenParams? params]) {
    return repositories.getAllHistories();
  }
}

class MainScreenParams extends Equatable {
  //props to set
  @override
  List<Object?> get props => [/*this.props*/];
  const MainScreenParams(/*[ ...this.props]*/);
}
