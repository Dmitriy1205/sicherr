part of 'home_position_cubit.dart';

@freezed
class HomePositionState with _$HomePositionState {
  const HomePositionState._();

  LatLng? get position =>
      maybeMap(loaded: (state) => state.position, routPicked: (state) => state.position, orElse: () => null);

  LatLng? get markerPosition => maybeMap(
      routPicked: (state) => state.markerPosition,
      navigating: (state) => state.markerPosition,
      orElse: () => null);

  bool get navigationStarted => maybeMap(
      navigating: (_) => true,
      orElse: () => false);

  RouteDetails get routeDetails => maybeMap(
        routPicked: (state) => state.routeDetails,
        navigating: (state) => state.routeDetails,
        successfullyFinished: (state) => state.routeDetails,
        navigationFailed: (state) => state.routeDetails,
        orElse: () => const RouteDetails(
          route: [],
          distance: 0,
          radius: 500,
          etaContacts: [],
        ),
      );

  const factory HomePositionState.initial() = _Initial;

  const factory HomePositionState.loaded({required LatLng? position}) = _Loaded;

  const factory HomePositionState.routPicked(
      {required LatLng? position,
      required RouteDetails routeDetails,
      required LatLng markerPosition}) = _RoutPicked;

  const factory HomePositionState.successfullyFinished({required RouteDetails routeDetails}) = _SuccessfullyFinished;

  const factory HomePositionState.navigationFailed({required LatLng userLastPosition, required RouteDetails routeDetails}) = _NavigationFailed;

  const factory HomePositionState.navigating(
      {required LatLng? position,
        required RouteDetails routeDetails,
        required LatLng markerPosition,
      required int minutesLeft,
      required bool showWarning}) = _NavigationStarted;

  const factory HomePositionState.error({required String error}) = _Error;
}
