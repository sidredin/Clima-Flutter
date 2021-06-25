import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  getCurrentLocation() async {
    try {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
