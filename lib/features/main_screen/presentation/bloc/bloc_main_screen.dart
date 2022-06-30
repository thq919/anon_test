// ignore_for_file: unused_import

import 'package:anon_test/core/errors/failure.dart';
import 'package:anon_test/features/main_screen/domain/entity/history_list_entity.dart';
import 'package:anon_test/features/main_screen/domain/usecases/main_screen_usecases.dart';
import 'package:anon_test/features/main_screen/presentation/bloc/bloc_main_screen_events.dart';
import 'package:anon_test/features/main_screen/presentation/bloc/bloc_main_screen_states.dart';
import 'package:anon_test/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocMainScreen extends Bloc<BlocMainScreenEvents, BlocMainScreenStates> {
  MainScreenUseCases useCases;
  BlocMainScreen(this.useCases) : super(InitialState()) {
    on<InitialEvent>((event, emit) async {
      Either<Failure, HistoryListEntity?> foldable = await useCases();
      foldable.fold((left) => null, (right) => null);
    });
    // events go on
  }
}
