part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const SignInState._();

  String? get verificationId => maybeMap(
      unVerified: (state) => state.verificationId,
      orElse: () {
        return null;
      });
  String? get phoneNumber => maybeMap(
      unVerified: (state) => state.phoneNumber,
      orElse: () {
        return null;
      });

  const factory SignInState.initial() = _Initial;

  const factory SignInState.loading() = _Loading;
  const factory SignInState.loaded() = _Loaded;

  const factory SignInState.unVerified({required String verificationId,required String phoneNumber}) =
      _UnVerified;

  const factory SignInState.verified() = _Verified;

  const factory SignInState.error({required String message, String? code}) = _Error;
}
