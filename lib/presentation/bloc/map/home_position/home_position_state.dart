part of 'home_position_cubit.dart';

@freezed
class HomePositionState with _$HomePositionState {
  const HomePositionState._();

  LatLng? get position =>
      maybeMap(loaded: (state) => state.position, orElse: () => null);

  RouteDetails get routeDetails => maybeMap(
        routPicked: (state) => state.routeDetails,
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
      required RouteDetails routeDetails}) = _RoutPicked;

  const factory HomePositionState.error({required String error}) = _Error;
}
