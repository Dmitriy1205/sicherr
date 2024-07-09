part of 'send_sos_bloc.dart';

@freezed
class SendSosState with _$SendSosState {
  const SendSosState._();

  bool get isStreamingSOS =>
      maybeMap(streaming: (_) => true, orElse: () => false);

  List<String> get emUsersUids =>
      maybeMap(streaming: (state) => state.emUsersUids, orElse: () => []);

  const factory SendSosState.initial() = _Initial;

  const factory SendSosState.quickBindingTriggered() = _QuickBindingTriggered;

  const factory SendSosState.loading() = _Loading;

  const factory SendSosState.success() = _Success;

  const factory SendSosState.streaming({required List<String> emUsersUids}) =
      _Streaming;

  const factory SendSosState.error({required String message, String? code}) =
      _Error;
}
