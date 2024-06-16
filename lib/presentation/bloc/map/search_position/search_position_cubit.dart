import 'package:bloc/bloc.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../domain/entities/navigation/place_details/place_details.dart';
import '../../../../domain/repositories/navigation/navigation_repository.dart';

part 'search_position_state.dart';

part 'search_position_cubit.freezed.dart';

class SearchPositionCubit extends Cubit<SearchPositionState> {
  final NavigationRepository _navigationRepository;

  SearchPositionCubit({
    required NavigationRepository navigationRepository,
  })  : _navigationRepository = navigationRepository,
        super(const SearchPositionState.initial());

  Future<void> getPlaces({required String query}) async {
    final places = await _navigationRepository.getPlaces(query: query);
    emit(SearchPositionState.loaded(searchResult: places));
  }

  Future<void> pickPosition({required String placeId}) async {
    final AppPlaceDetails pickedPlace =
        await _navigationRepository.pickPosition(placeId: placeId);
    emit(SearchPositionState.positionPicked(placeDetails: pickedPlace));
  }
}
