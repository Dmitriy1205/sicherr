part of 'contact_identification_bloc.dart';

@freezed
class ContactIdentificationState with _$ContactIdentificationState {
  const factory ContactIdentificationState.initial() = _Initial;
  const factory ContactIdentificationState.loaded() = _Loaded;
  const factory ContactIdentificationState.error({required String error}) = _Error;
}
