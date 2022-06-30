import 'package:camera/camera.dart';

abstract class BlocRecordHistoryStates {}

class InitialState extends BlocRecordHistoryStates {}

class GotCamConnectState extends BlocRecordHistoryStates {
  CameraController controller;
  GotCamConnectState(this.controller);
}

class ErrorOnGettingCamState extends BlocRecordHistoryStates {
  String errmsg;
  ErrorOnGettingCamState(this.errmsg);
}
