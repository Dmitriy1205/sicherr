import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sicherr/core/utils/phone_encryptor.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/domain/entities/navigation/route_details/route_details.dart';
import 'package:sicherr/domain/entities/tracking/tracking.dart';
import 'package:sicherr/domain/entities/tracking_polygone/tracking_polygone.dart';
import 'package:sicherr/domain/repositories/location_sharing/location_sharing_repository_contract.dart';
import 'package:sicherr/domain/repositories/user/user_repository.dart';

import '../../../../data/local/home_position_prefs.dart';
import '../../../../domain/repositories/navigation/navigation_repository.dart';
import '../../../../domain/repositories/notification/notification_repository.dart';

part 'home_position_state.dart';

part 'home_position_cubit.freezed.dart';

class HomePositionCubit extends Cubit<HomePositionState> {
  final HomePositionPrefs _homePositionPrefs;
  final UserRepository _userRepository;
  final NavigationRepository _navigationRepository;
  final LocationSharingRepository _locationSharingRepository;
  final NotificationRepository _notificationRepository;

  HomePositionCubit({
    required HomePositionPrefs homePositionPrefs,
    required NavigationRepository navigationRepository,
    required LocationSharingRepository locationSharingRepository,
    required UserRepository userRepository,
    required NotificationRepository notificationRepository,
  })  : _homePositionPrefs = homePositionPrefs,
        _navigationRepository = navigationRepository,
        _locationSharingRepository = locationSharingRepository,
        _userRepository = userRepository,
        _notificationRepository = notificationRepository,
        super(const HomePositionState.initial());

  void reset() async {
    await _locationSharingRepository.cancelSharingTrackingTo(
        usersUid: state.routeDetails.etaContacts.map((e) => e.id).toList());
    emit(const HomePositionState.initial());
  }

  Future<void> getPosition() async {
    LatLng? position = await _navigationRepository.getHomePosition();
    emit(HomePositionState.loaded(position: position));
  }

  Future<void> setPosition({required LatLng position}) async {
    await _homePositionPrefs.deletePosition();
    await _homePositionPrefs.setPosition(position);
    LatLng? newPosition = await _homePositionPrefs.getPosition();
    emit(HomePositionState.loaded(position: newPosition));
  }

  Future<void> removePosition() async {
    await _homePositionPrefs.deletePosition();
    LatLng? newPosition = await _homePositionPrefs.getPosition();
    emit(HomePositionState.loaded(position: newPosition));
  }

  Future<void> setRoute({
    required LatLng userPosition,
    required LatLng markerPosition,
  }) async {
    emit(const HomePositionState.initial());
    RouteDetails? routeDetails = await _navigationRepository.getRouteDetails(
        userPosition: userPosition, markerPosition: markerPosition);
    LatLng? position = await _navigationRepository.getHomePosition();
    emit(HomePositionState.routPicked(
        position: position,
        routeDetails: routeDetails!,
        markerPosition: markerPosition));
  }

  Future<void> notifyEtaContacts(
      {required String title, required String message, required Map<String,dynamic> data}) async {
    final etaPhoneNumbers =
        state.routeDetails.etaContacts.map((e) => e.phoneNumber).toList();
    return _notificationRepository.sendNotification(
      data: data,
        title: title, message: message, phones: etaPhoneNumbers);
  }

  Future<void> navigate(
      {required Position userPosition,
      required String userId,
      required String userName, String? photoURL}) async {
    if (state.markerPosition == null) return;
    final sharedEta = state.routeDetails.etaContacts.map((e) => e.id).toList();
    final position = state.position;
    RouteDetails? routeDetails = await _navigationRepository.getRouteDetails(
        userPosition: LatLng(userPosition.latitude, userPosition.longitude),
        markerPosition: state.markerPosition!);
    final initialRouteDetails = state.routeDetails;
    final initialRouteList = initialRouteDetails.route
        .map((e) => [e.longitude, e.latitude])
        .toList();
    final minutesLeft = _calculateTimeLeft(routeDetails!.distance / 1000, 4);
    final deviation = _checkDeviation(
        userPosition, initialRouteDetails.radius, initialRouteList);
    final navigationFailed = deviation >= 1;
    final polygones = state.routeDetails.route
        .map((e) => TrackingPolygone(lat: e.latitude, long: e.longitude))
        .toList();
    final tracking = Tracking(
      photoURL: photoURL,
        userId: userId,
        userName: userName,
        lat: userPosition.latitude,
        long: userPosition.longitude,
        polygones: polygones);
    _locationSharingRepository.shareTrackingTo(
        usersUid: sharedEta, tracking: tracking);
    if (navigationFailed) {
      await _locationSharingRepository.cancelSharingTrackingTo(
          usersUid: sharedEta);
      emit(HomePositionState.navigationFailed(
        routeDetails: state.routeDetails,
          userLastPosition:
              LatLng(userPosition.latitude, userPosition.longitude)));
      await Future.delayed(Duration(seconds: 1));
      emit(const HomePositionState.initial());
      return;
    }
    final showWarning = deviation >= 0.6;
    if (minutesLeft <= 1) {
      await _locationSharingRepository.cancelSharingTrackingTo(
          usersUid: sharedEta);
      emit(HomePositionState.successfullyFinished(routeDetails: state.routeDetails));
      await Future.delayed(Duration(seconds: 1));
      emit(const HomePositionState.initial());
      getPosition();
    } else {
      emit(HomePositionState.navigating(
          position: position,
          routeDetails: state.routeDetails,
          minutesLeft: minutesLeft,
          markerPosition: state.markerPosition!,
          showWarning: showWarning));
    }
  }

  Future<void> setRadius({
    required RouteDetails routeDetails,
    required int pickedRadius,
  }) async {
    final newRouteDetails = routeDetails.copyWith(radius: pickedRadius);
    LatLng? position = await _navigationRepository.getHomePosition();
    emit(HomePositionState.routPicked(
        position: position,
        routeDetails: newRouteDetails,
        markerPosition: state.markerPosition!));
  }

  Future<void> setEtaContact({
    required RouteDetails routeDetails,
    required ContactEntity? etaContact,
  }) async {
    RouteDetails newRouteDetails;
    if (etaContact != null) {
      final encryptedPhoneNumber =
          PhoneNumberEncryptor().encrypt(etaContact.id);
      final etaContactId =
          await _userRepository.getUserIdByPhoneNumber(encryptedPhoneNumber);
      if (etaContactId != null) {
        newRouteDetails = routeDetails
            .copyWith(etaContacts: [etaContact.copyWith(id: etaContactId)]);
      } else {
        newRouteDetails = routeDetails.copyWith(etaContacts: []);
      }
    } else {
      newRouteDetails = routeDetails.copyWith(etaContacts: []);
    }

    LatLng? position = await _navigationRepository.getHomePosition();
    emit(HomePositionState.routPicked(
        position: position,
        routeDetails: newRouteDetails,
        markerPosition: state.markerPosition!));
  }

  ///Returns how much in relation to [radius] user [currentPosition] deviates from [route], 0 - no deviation, >= 1 - radius is left
  double _checkDeviation(
      Position currentPosition, int radius, List<List<double>> route) {
    double minDistance = double.infinity;

    for (var point in route) {
      double distance = _calculateDistance(
        currentPosition.latitude,
        currentPosition.longitude,
        point[1],
        point[0],
      );
      if (distance < minDistance) {
        minDistance = distance;
      }
    }

    return minDistance / radius;
  }

  double _calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371000;
    final double dLat = _degreesToRadians(lat2 - lat1);
    final double dLon = _degreesToRadians(lon2 - lon1);

    final double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(lat1)) *
            cos(_degreesToRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  double _radiansToDegrees(double radians) {
    return radians * 180 / pi;
  }

  int _calculateTimeLeft(double distance, double averageSpeedKmH) {
    return (distance / averageSpeedKmH * 60).toInt();
  }
}
