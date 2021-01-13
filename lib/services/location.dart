import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  Future<void> getCurrentLocation() async {
    try {
      Position userPosition = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      longitude = userPosition.longitude;
      latitude = userPosition.latitude;
    } catch (e) {
      print(e);
    }
  }
}
