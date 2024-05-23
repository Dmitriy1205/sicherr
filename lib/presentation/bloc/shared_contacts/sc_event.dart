part of 'sc_bloc.dart';

@freezed
class ScEvent with _$ScEvent {
  const factory ScEvent.getAllSC() = _GetAllSC;

  const factory ScEvent.addTag({
    required String contactId,
    required String taName,
  }) = _AddTag;

  const factory ScEvent.addRemoveRating({
    required String contactId,
    required String rate,
  }) = _AddRemoveRating;
}
