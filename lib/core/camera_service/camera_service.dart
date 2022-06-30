import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CameraService {
  ImagePicker picker;
  CameraService({required this.picker});

  Future<XFile?> pickImageFromGallery() async {
    try {
      return await ImagePicker().pickImage(source: ImageSource.gallery);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('pickImageFromGallery: $e');
      }
      return null;
    }
  }

  Future<XFile?> pickImageCamera() async {
    try {
      return await ImagePicker().pickImage(source: ImageSource.camera);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('pickImageCamera: $e');
      }
      return null;
    }
  }

  Future<XFile?> pickVideoFromGallery() async {
    try {
      return await ImagePicker().pickVideo(source: ImageSource.gallery, maxDuration: const Duration(seconds: 15));
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('pickVideoFromGallery: $e');
      }
      return null;
    }
  }

  Future<XFile?> pickVideoCamera() async {
    try {
      return await ImagePicker().pickVideo(source: ImageSource.camera, maxDuration: const Duration(seconds: 15));
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('pickVideoCamera: $e');
      }
      return null;
    }
  }
}
