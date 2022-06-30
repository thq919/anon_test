import 'package:anon_test/features/main_screen/presentation/bloc/bloc_main_screen.dart';
import 'package:anon_test/features/main_screen/presentation/bloc/bloc_main_screen_events.dart';
import 'package:anon_test/features/main_screen/presentation/page/main_screen_page.dart';
import 'package:anon_test/features/record_history_screen/presentation/bloc/bloc_record_history.dart';
import 'package:anon_test/features/record_history_screen/presentation/page/record_history_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anon_test/service_locator.dart' as inject;
import 'package:anon_test/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inject.init();
  await sl.allReady();
   runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocMainScreen>(
          create: (context) => sl<BlocMainScreen>()..add(InitialEvent())),
          BlocProvider<BlocRecordScreen>(
          create: (context) => sl<BlocRecordScreen>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => const MainScreenPage(),
          '/recordHistory': ((context) => const RecordHistoryPage())
        },
      ),
    );
  }
}
