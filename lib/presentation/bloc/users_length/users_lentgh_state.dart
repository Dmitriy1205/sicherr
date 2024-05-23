part of 'users_lentgh_cubit.dart';

@freezed
class UsersLengthState with _$UsersLengthState {
  const UsersLengthState._();

  int get usersLength =>
      maybeMap(loaded: (state) => state.usersLength, orElse: () => 0);

  const factory UsersLengthState.initial() = _Initial;

  const factory UsersLengthState.loading() = _Loading;

  const factory UsersLengthState.loaded({required int usersLength}) = _Loaded;

  const factory UsersLengthState.error({required String error}) = _Error;
}
