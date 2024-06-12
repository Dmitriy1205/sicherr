import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePositionPrefs {
  final String lastCreatedAtKey = 'homePosition';

  String latLngToJson(LatLng latLng) {
    final Map<String, dynamic> data = {
      'latitude': latLng.latitude,
      'longitude': latLng.longitude,
    };
    return json.encode(data);
  }

  LatLng? latLngFromJson(String? jsonStr) {
    if (jsonStr == null) {
      return null;
    }
    final Map<String, dynamic> data = json.decode(jsonStr);
    return LatLng(data['latitude'], data['longitude']);
  }

  Future<LatLng?> getPosition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jsonStr = prefs.getString(lastCreatedAtKey);
    return latLngFromJson(jsonStr);
  }

  Future<void> setPosition(LatLng position) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String jsonStr = latLngToJson(position);
    await prefs.setString(lastCreatedAtKey, jsonStr);
  }

  Future<void> deletePosition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(lastCreatedAtKey);
  }
}
