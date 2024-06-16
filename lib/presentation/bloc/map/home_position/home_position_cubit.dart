import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/domain/entities/navigation/route_details/route_details.dart';

import '../../../../data/local/home_position_prefs.dart';
import '../../../../domain/repositories/navigation/navigation_repository.dart';

part 'home_position_state.dart';

part 'home_position_cubit.freezed.dart';

class HomePositionCubit extends Cubit<HomePositionState> {
  final HomePositionPrefs _homePositionPrefs;
  final NavigationRepository _navigationRepository;

  HomePositionCubit({
    required HomePositionPrefs homePositionPrefs,
    required NavigationRepository navigationRepository,
  })  : _homePositionPrefs = homePositionPrefs,
        _navigationRepository = navigationRepository,
        super(const HomePositionState.initial());

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
        position: position, routeDetails: routeDetails!));
  }

  Future<void> setRadius({
    required RouteDetails routeDetails,
    required int pickedRadius,
  }) async {
    final newRouteDetails = routeDetails.copyWith(radius: pickedRadius);
    LatLng? position = await _navigationRepository.getHomePosition();
    emit(HomePositionState.routPicked(
        position: position, routeDetails: newRouteDetails));
  }

  Future<void> setEtaContact({
    required RouteDetails routeDetails,
    required ContactEntity? etaContact,
  }) async {
    RouteDetails newRouteDetails;
    if (etaContact != null) {
      newRouteDetails = routeDetails.copyWith(etaContacts: [etaContact]);
    } else {
      newRouteDetails = routeDetails.copyWith(etaContacts: []);
    }

    LatLng? position = await _navigationRepository.getHomePosition();
    emit(HomePositionState.routPicked(
        position: position, routeDetails: newRouteDetails));
  }
}
