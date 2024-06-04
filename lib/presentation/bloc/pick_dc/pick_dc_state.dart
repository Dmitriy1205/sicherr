part of 'pick_dc_cubit.dart';

@freezed
class PickDcState with _$PickDcState {
  const PickDcState._();

  List<ContactEntity> get contacts =>
      maybeMap(picked: (state) => state.contacts, orElse: () => []);

  Map<String, List<ContactEntity>> get allContactsCategorized => maybeMap(
      picked: (state) => state.allContactsCategorized,
      orElse: () => {});

  Map<String, List<ContactEntity>> get searchedContactsCategorized => maybeMap(
      picked: (state) => state.searchedContactsCategorized,
      orElse: () => {});

  const factory PickDcState.initial() = _Initial;

  const factory PickDcState.picked({required List<ContactEntity> contacts, required Map<String, List<ContactEntity>> allContactsCategorized, required Map<String, List<ContactEntity>> searchedContactsCategorized}) = _Picked;
}
