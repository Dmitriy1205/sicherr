part of 'emergency_contact_bloc.dart';

@freezed
class EmergencyContactState with _$EmergencyContactState {
  const EmergencyContactState._();

  List<EmergencyContact>? get emContacts =>
      maybeMap(loaded: (state) => state.emContacts, orElse: () => null);

  const factory EmergencyContactState.initial() = _Initial;

  const factory EmergencyContactState.loading() = _Loading;

  const factory EmergencyContactState.loaded(
      {required List<EmergencyContact>? emContacts}) = _Loaded;

  const factory EmergencyContactState.error({required String error}) = _Error;
}
