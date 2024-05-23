part of 'pick_dc_cubit.dart';

@freezed
class PickDcState with _$PickDcState {
  const PickDcState._();

  List<ContactEntity>? get contacts =>
      maybeMap(picked: (state) => state.contacts, orElse: () => []);

  const factory PickDcState.initial() = _Initial;

  const factory PickDcState.picked({required List<ContactEntity> contacts}) = _Picked;
}
