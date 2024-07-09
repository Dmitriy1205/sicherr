import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/tracking/tracking.dart';
import '../../../domain/repositories/location_sharing/location_sharing_repository_contract.dart';

part 'tracking_state.dart';
part 'tracking_cubit.freezed.dart';

class TrackingCubit extends Cubit<TrackingState> {
  final LocationSharingRepository _locationSharingRepository;

  StreamSubscription? _streamSubscription;

  TrackingCubit({required LocationSharingRepository locationSharingRepository}) :
        _locationSharingRepository = locationSharingRepository,
        super(const TrackingState.initial());

  void startListeningTrackings({required String userUid}){
    _streamSubscription = _locationSharingRepository.usersTracking(userUid: userUid).listen((event) {
      emit(TrackingState.loaded(tracking: event));
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
