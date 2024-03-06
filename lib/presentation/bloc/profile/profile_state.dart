part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const ProfileState._();

  UserProfile? get profileInfo =>
      maybeMap(loaded: (state) => state.profileInfo, orElse: () => null);

  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.loading() = _Loading;

  const factory ProfileState.loaded({required UserProfile? profileInfo}) =
      _Loaded;

  const factory ProfileState.error({required String error}) = _Error;
}
