import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
class Location{
  late double latitude;
  late double longitude;
  // Location({this.latitude,this.longitude});
Future<void> getCurrentLocation() async {
  try {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium).timeout(const Duration(seconds: 15));
    latitude = position.latitude;
    longitude = position.longitude;
  }
  catch(e){
       latitude = 11.0168;
       longitude = 76.9558;
    if (kDebugMode) {
      print('Error Occurred : $e');
    }
  }
}
}