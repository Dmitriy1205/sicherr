part of 'dc_bloc.dart';

@freezed
class DcEvent with _$DcEvent {
  const factory DcEvent.getAllDC() = _GetAllDC;

  const factory DcEvent.addToDC({required dynamic dangerContact}) = _AddToDC;

  const factory DcEvent.removeFromDC({required String dcId}) = _RemoveFromDC;
}
