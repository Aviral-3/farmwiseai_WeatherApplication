import 'package:geolocator/geolocator.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<Position> getCurrentLocation() async {
    // Check if location services are enabled.
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled; handle as needed.
      throw Exception('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied; handle as needed.
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever; handle as needed.
      throw Exception('Location permissions are permanently denied.');
    }

    // When permissions are granted, return the current position.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}
