import 'package:freezed_annotation/freezed_annotation.dart';

part 'documents.freezed.dart';
part 'documents.g.dart';

@freezed
class Documents with _$Documents {
  const factory Documents({
    @Default("") String termsHTML,
    @Default("") String supportHTML
  }) = _Documents;

  factory Documents.fromJson(Map<String, Object?> json)
  => _$DocumentsFromJson(json);
}