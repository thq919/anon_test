import 'package:anon_test/core/camera_serice_2/camera_service_native.dart';
import 'package:anon_test/features/record_history_screen/presentation/bloc/bloc_record_history_events.dart';
import 'package:anon_test/features/record_history_screen/presentation/bloc/bloc_record_history_states.dart';
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocRecordScreen
    extends Bloc<BlocRecordHistoryEvents, BlocRecordHistoryStates> {
  CameraServiceNative service;
  late CameraController controller;

  BlocRecordScreen(this.service) : super(InitialState()) {
    on<InitialEvent>((event, emit) async {
      controller = service.getController(
          service.cameras.first, ResolutionPreset.ultraHigh);
      try {
        await controller.initialize().then((_) {
          emit(GotCamConnectState(controller));
        });
      } catch (e) {
        emit(ErrorOnGettingCamState(e.toString()));
      }
    });
    on<DropControllerEvent>((event, emit)  async {
      await controller.dispose().then((_) => emit(InitialState()));
      
    });
  }
}

 /*
      try {
        XFile? file = await service.pickVideoCamera();
        if (file is XFile) {
          emit(GotCamConnectState(file));
        }
      } catch (e) {
        emit(ErrorOnGettingCamState(e.toString()));
      }
      */