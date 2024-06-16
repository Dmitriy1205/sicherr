import 'package:flutter_google_maps_webservices/places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sicherr/domain/entities/navigation/place_details/place_details.dart';

import '../../entities/navigation/route_details/route_details.dart';

abstract class NavigationRepository {
  Future<LatLng?> getHomePosition();

  Future<String> getPositionDetails({required LatLng position});

  Future<RouteDetails?> getRouteDetails({
    required LatLng userPosition,
    required LatLng markerPosition,
  });

  Future<void> addHomePosition({required LatLng position});

  Future<List<Prediction>> getPlaces({required String query});

  Future<AppPlaceDetails> pickPosition({required String placeId});

  Future<void> removeHomePosition();

  Future<void> startNavigation({required LatLng? currentPosition, required RouteDetails routeDetails});

  Future<void> stopNavigation();
}
