import 'package:camera/camera.dart';

class CameraServiceNative {
  List<CameraDescription> cameras;

  CameraServiceNative(this.cameras);




  static Future<List<CameraDescription>> getCameras() async {
    List<CameraDescription> cameras = await availableCameras();
    return cameras;
  }

  CameraController getController(
      CameraDescription camera, ResolutionPreset quality) {
    return CameraController(
      camera,
      quality,
    );
  }
}
