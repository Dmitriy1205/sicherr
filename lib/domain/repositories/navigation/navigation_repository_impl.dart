import 'package:flutter_google_maps_webservices/places.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sicherr/core/const/strings.dart';
import 'package:sicherr/domain/entities/navigation/place_details/place_details.dart';
import 'package:sicherr/domain/entities/navigation/route_details/route_details.dart';
import 'package:sicherr/domain/repositories/navigation/navigation_repository.dart';

import '../../../data/local/home_position_prefs.dart';

enum RouteStatus {
  deviated,
  arrived,
  navigating,
  noPositioned,
}

class NavigationRepositoryImpl extends NavigationRepository {
  final HomePositionPrefs _homePositionPrefs;
  final PolylinePoints polylinePoints = PolylinePoints();
  final places = GoogleMapsPlaces(apiKey: AppStrings.googleAPIKey);

  NavigationRepositoryImpl({required HomePositionPrefs homePositionPrefs})
      : _homePositionPrefs = homePositionPrefs;

  @override
  Future<void> addHomePosition({required LatLng position}) async {
    await _homePositionPrefs.deletePosition();
    await _homePositionPrefs.setPosition(position);
  }

  @override
  Future<LatLng?> getHomePosition() async {
    LatLng? position = await _homePositionPrefs.getPosition();
    return position;
  }

  @override
  Future<void> removeHomePosition() async {
    await _homePositionPrefs.deletePosition();
  }

  @override
  Future<String> getPositionDetails({required LatLng position}) async {
    final details = await _getAddressFromLatLng(position: position);
    return details;
  }

  @override
  Future<RouteDetails?> getRouteDetails({
    required LatLng userPosition,
    required LatLng markerPosition,
  }) async {
    RouteDetails routeDetails = await _getPolyline(
        userPosition: userPosition, markerPosition: markerPosition);
    return routeDetails;
  }

  @override
  Future<List<Prediction>> getPlaces({required String query}) async {
    if (query.isEmpty) {
      return [];
    } else {
      final response = await places.autocomplete(
        query,
        language: 'en',
        types: ['address'],
      );

      return response.predictions;
    }
  }

  @override
  Future<AppPlaceDetails> pickPosition({required String placeId}) async {
    final placeDetails = await places.getDetailsByPlaceId(placeId);
    final address = placeDetails.result.formattedAddress;
    final lat = placeDetails.result.geometry!.location.lat;
    final lng = placeDetails.result.geometry!.location.lng;
    return AppPlaceDetails(address: address!, latlng: LatLng(lat, lng));
  }

  @override
  Future<void> startNavigation(
      {required LatLng? currentPosition, required RouteDetails routeDetails}) async {
    //TODO: need to finish implementation, return some navigation model with  RouteStatus and real position, maybe change to stream
   final RouteStatus routeStatus = await _checkDeviation(
        currentPosition: currentPosition,
        route: routeDetails.route,
        radius: routeDetails.radius);
  }

  @override
  Future<void> stopNavigation() async {
    //TODO: need to finish implementation to stop navigation
  }

  ///get route status for showing if user deaviate route
  Future<RouteStatus> _checkDeviation({
    required LatLng? currentPosition,
    required List<LatLng> route,
    required int radius,
  }) async {
    if (currentPosition == null) return RouteStatus.noPositioned;

    double minDistance = double.infinity;

    for (var point in route) {
      double distance = Geolocator.distanceBetween(
        currentPosition.latitude,
        currentPosition.longitude,
        point.latitude,
        point.longitude,
      );
      if (distance < minDistance) {
        minDistance = distance;
      }
    }

    if (minDistance > radius) {
      return RouteStatus.deviated;
    } else if (minDistance <= 0.10) {
      return RouteStatus.arrived;
    } else {
      return RouteStatus.navigating;
    }
  }

  Future<String> _getAddressFromLatLng({required LatLng position}) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    Placemark place = placemarks[0];

    return place.street!.isEmpty || place.name == place.street
        ? '${place.name}'
        : '${place.subLocality}, ${place.name}';
  }
  ///get polylines between positions to show route
  Future<RouteDetails> _getPolyline({
    required LatLng userPosition,
    required LatLng markerPosition,
  }) async {
    List<LatLng> route;
    double distance;
    final result = await polylinePoints.getRouteBetweenCoordinates(
      AppStrings.googleAPIKey,
      PointLatLng(userPosition.latitude, userPosition.longitude),
      PointLatLng(markerPosition.latitude, markerPosition.longitude),
    );

    if (result.points.isNotEmpty) {
      route = result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();

      distance = Geolocator.distanceBetween(
        userPosition.latitude,
        userPosition.longitude,
        markerPosition.latitude,
        markerPosition.longitude,
      );
      return RouteDetails(
        route: route,
        distance: distance,
        radius: 500,
        etaContacts: [],
      );
    } else {
      return const RouteDetails(
        route: [],
        distance: 0,
        radius: 500,
        etaContacts: [],
      );
    }
  }
}
