part of 'search_position_cubit.dart';

@freezed
class SearchPositionState with _$SearchPositionState {
  const SearchPositionState._();

  AppPlaceDetails? get placeDetails => maybeMap(
        positionPicked: (state) => state.placeDetails,
        orElse: () => const AppPlaceDetails(
          address: '',
          latlng: LatLng(0, 0),
        ),
      );

  List<Prediction> get searchResult => maybeMap(
        loaded: (state) => state.searchResult,
        orElse: () => [],
      );

  const factory SearchPositionState.initial() = _Initial;

  const factory SearchPositionState.loaded(
      {required List<Prediction> searchResult}) = _Loaded;

  const factory SearchPositionState.positionPicked({
    required AppPlaceDetails placeDetails,
  }) = _PositionPicked;

  const factory SearchPositionState.error({required String error}) = _Error;
}
