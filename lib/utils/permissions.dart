import 'package:permission_handler/permission_handler.dart';

class Permissions {
  static Future<bool> requestStoragePermission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      status = await Permission.storage.request();
    }
    return status.isGranted;
  }

  Future<bool> requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isDenied || status.isRestricted) {
      status = await Permission.camera.request();
      if (status.isGranted) {
        return true;
      }
      return false;
    }
    return true;
  }

  static Future<bool> requestLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      status = await Permission.location.request();
    }
    return status.isGranted;
  }

// Add other permission request methods as needed


}
