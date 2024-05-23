part of 'sc_bloc.dart';

@freezed
class ScState with _$ScState {
  const ScState._();

  List<ContactEntity>? get sc =>
      maybeMap(loaded: (state) => state.sc, orElse: () => null);

  const factory ScState.initial() = _Initial;

  const factory ScState.loading() = _Loading;

  const factory ScState.loaded({required List<ContactEntity> sc}) = _Loaded;

  const factory ScState.error({required String error}) = _Error;
}
