import 'package:anon_test/core/camera_serice_2/camera_service_native.dart';
import 'package:anon_test/core/camera_service/camera_service.dart';
import 'package:anon_test/core/database/appdatabase.dart';
import 'package:anon_test/features/main_screen/data/datasource/history_model_dao.dart';
import 'package:anon_test/features/main_screen/data/repositories/history_list_repositories.dart';
import 'package:anon_test/features/main_screen/domain/repositores/history_list_repositories.dart';
import 'package:anon_test/features/main_screen/domain/usecases/main_screen_usecases.dart';
import 'package:anon_test/features/main_screen/presentation/bloc/bloc_main_screen.dart';
import 'package:anon_test/features/record_history_screen/presentation/bloc/bloc_record_history.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';

import 'features/main_screen/data/datasource/history_list_dao.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  /* __________________________ CORE ________________________________*/

  // Database

  sl.registerSingletonAsync<AppDatabase>(() async {
    return await $FloorAppDatabase
        .databaseBuilder('${await getDatabasesPath()}/main.db')
        .build();
  });
  // TODO: выбрать один вариант камера сервайса и убрать второй
  // CameraService первый вариант по индусам

  sl.registerSingleton<CameraService>(CameraService(picker: ImagePicker()));

  // CameraService Native второй вариант по доке

  sl.registerSingletonAsync<CameraServiceNative>(() async {
    return CameraServiceNative(await CameraServiceNative.getCameras());
  });

  /* ________________________ FEATURES _________________________________*/

  //Main Screen

  // Blocks

  sl.registerLazySingleton<BlocMainScreen>(
      (() => BlocMainScreen(sl<MainScreenUseCases>())));

  // UseCases

  sl.registerLazySingleton<MainScreenUseCases>(() => MainScreenUseCases(sl()));

  // Repositories

  sl.registerLazySingleton<HistoryListRepositories>(
      () => HistoryListRepositoriesImpl(sl(), sl()));

  // DataSources
  // Вот тут не уверен, надо два сурца или один?
  sl.registerSingletonAsync<HistoryListDAO>(() async {
    AppDatabase db = await sl.getAsync<AppDatabase>();
    return db.historyListDao;
  }, dependsOn: [AppDatabase]);

  sl.registerSingletonAsync<HistoryEntityDAO>(() async {
    AppDatabase db = await sl.getAsync<AppDatabase>();
    return db.historyEntityDAO;
  }, dependsOn: [AppDatabase]);

  // History Record screen

  // Blocks

  sl.registerSingletonAsync<BlocRecordScreen>(() async {
    CameraServiceNative serviceNative =
        await sl.getAsync<CameraServiceNative>();
    return BlocRecordScreen(serviceNative);
  }, dependsOn: [CameraServiceNative]);
}
