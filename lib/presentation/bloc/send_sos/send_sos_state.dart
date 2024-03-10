part of 'send_sos_bloc.dart';

@freezed
class SendSosState with _$SendSosState {
  const factory SendSosState.initial() = _Initial;

  const factory SendSosState.loading() = _Loading;

  const factory SendSosState.success() = _Success;

  const factory SendSosState.error({required String message, String? code}) =
      _Error;
}
