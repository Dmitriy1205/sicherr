part of 'send_sos_bloc.dart';

@freezed
class SendSosState with _$SendSosState {
  const SendSosState._();

  bool get isDialogOpened => maybeMap(
      dialogOpened: (_) => true,
      orElse: () => false);

  const factory SendSosState.initial() = _Initial;

  const factory SendSosState.dialogOpened() = _DialogOpened;

  const factory SendSosState.loading() = _Loading;

  const factory SendSosState.success() = _Success;

  const factory SendSosState.error({required String message, String? code}) =
      _Error;
}
