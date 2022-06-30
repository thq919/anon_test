import 'package:anon_test/features/record_history_screen/presentation/bloc/bloc_record_history.dart';
import 'package:anon_test/features/record_history_screen/presentation/bloc/bloc_record_history_states.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecordHistoryPage extends StatelessWidget {
  const RecordHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<BlocRecordScreen, BlocRecordHistoryStates>(
      builder: (context, state) {
        if (state is GotCamConnectState) {
          return FittedBox(
            fit: BoxFit.fill,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CameraPreview(state.controller),
            ),
          );
        } else if (state is ErrorOnGettingCamState) {
          return Center(child: Text(state.errmsg));
        }
        return const Center(child: CircularProgressIndicator(), 
        );
      },
    ));
  }
}
