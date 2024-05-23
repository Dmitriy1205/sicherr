part of 'dc_bloc.dart';

@freezed
class DcState with _$DcState {
  const DcState._();

  List<ContactEntity>? get dc =>
      maybeMap(loaded: (state) => state.dc, orElse: () => null);

  const factory DcState.initial() = _Initial;

  const factory DcState.loading() = _Loading;

  const factory DcState.loaded({required List<ContactEntity> dc}) = _Loaded;

  const factory DcState.error({required String error}) = _Error;
}
