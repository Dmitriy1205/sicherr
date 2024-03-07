import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/core/exceptions/exceptions.dart';
import 'package:sicherr/domain/repositories/user/user_repository.dart';

import '../../../domain/entities/user_profile/user_profile.dart';
import '../auth/auth_bloc.dart';

part 'profile_event.dart';

part 'profile_state.dart';

part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository _userRepository;
  final AuthBloc _authBloc;

  late StreamSubscription _profileStreamSubscription;

  ProfileBloc({
    required UserRepository userRepository,
    required AuthBloc authBloc,
  })  : _userRepository = userRepository,
        _authBloc = authBloc,
        super(const ProfileState.initial()) {
    on<ProfileEvent>(_mapToState);
  }

  Future<void> _mapToState(
          ProfileEvent event, Emitter<ProfileState> emit) async =>
      event.map(
        setProfileFields: (e) => _setProfileFields(e, emit),
        getProfileFields: (e) => _getProfileFields(e, emit),
        updateSpecificProfileField: (e) => _updateSpecificProfileField(e, emit),
        loadProfileFields: (e) =>
            emit(ProfileState.loaded(profileInfo: e.profileFields)),
        catchError: (e) => emit(ProfileState.error(error: e.error.toString())),
      );

  Future<void> _getProfileFields(
      _GetProfileFields event, Emitter<ProfileState> emit) async {
    try {
      emit(const ProfileState.loading());
      _profileStreamSubscription = _userRepository
          .getUserFieldsStream(currentUserId: _authBloc.state.user!.uid)
          .listen((profileFields) {
        if (profileFields == null) {
          add(ProfileEvent.setProfileFields(
              currentUserId: _authBloc.state.user!.uid));
        } else {
          add(ProfileEvent.loadProfileFields(profileFields: profileFields));
        }
      }, onError: (error) {
        add(ProfileEvent.catchError(error: error));
      });
    } on BadRequestException catch (e) {
      emit(ProfileState.error(error: e.message));
    }
  }

  Future<void> _setProfileFields(
      _SetProfileFields event, Emitter<ProfileState> emit) async {
    try {
      await _userRepository.setUserFields(
          currentUserId: event.currentUserId,
          phoneNumber: _authBloc.state.user!.phoneNumber!);
      _profileStreamSubscription = _userRepository
          .getUserFieldsStream(currentUserId: _authBloc.state.user!.uid)
          .listen((profileFields) {
        if (profileFields == null) {
          add(ProfileEvent.setProfileFields(
              currentUserId: _authBloc.state.user!.uid));
        } else {
          add(ProfileEvent.loadProfileFields(profileFields: profileFields));
        }
      }, onError: (error) {
        add(ProfileEvent.catchError(error: error));
      });
    } on BadRequestException catch (e) {
      emit(ProfileState.error(error: e.message));
    }
  }

  Future<void> _updateSpecificProfileField(
      _UpdateSpecificProfileField event, Emitter<ProfileState> emit) async {
    try {
      await _userRepository.updateUserFields(
          currentUserId: _authBloc.state.user!.uid, data: event.data);

      _profileStreamSubscription = _userRepository
          .getUserFieldsStream(currentUserId: _authBloc.state.user!.uid)
          .listen((profileFields) {
        if (profileFields == null) {
          add(ProfileEvent.setProfileFields(
              currentUserId: _authBloc.state.user!.uid));
        } else {
          add(ProfileEvent.loadProfileFields(profileFields: profileFields));
        }
      }, onError: (error) {
        add(ProfileEvent.catchError(error: error));
      });
    } on BadRequestException catch (e) {
      emit(ProfileState.error(error: e.message));
    }
  }

  @override
  Future<void> close() {
    _profileStreamSubscription.cancel();
    return super.close();
  }
}
