part of 'documents_cubit.dart';

@freezed
class DocumentsState with _$DocumentsState {
  const DocumentsState._();

  Documents get documents => maybeMap(
      loaded: (state) => state.documents,
      orElse: () => const Documents());

  const factory DocumentsState.initial() = _Initial;
  const factory DocumentsState.loaded({required Documents documents}) = _Loaded;
}
