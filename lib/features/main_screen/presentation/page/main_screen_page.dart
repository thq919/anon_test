import 'package:anon_test/features/main_screen/presentation/bloc/bloc_main_screen.dart';
import 'package:anon_test/features/main_screen/presentation/bloc/bloc_main_screen_states.dart';
import 'package:anon_test/features/main_screen/presentation/widgets/button_plus_history.dart';
import 'package:anon_test/features/main_screen/presentation/widgets/row_histories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreenPage extends StatelessWidget {
  const MainScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: BlocBuilder<BlocMainScreen, BlocMainScreenStates>(
          builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text('Главная', style: GoogleFonts.ubuntu(
                        fontSize: 40, fontWeight: FontWeight.w500)),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 14.0),
                    child: ButtonPlusHistory(),
                  ),
                  state is HistoriesLoaded
                      ? const RowHistories()
                      : const Text('Создайте историю')
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
