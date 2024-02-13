import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_codes.freezed.dart';
part 'country_codes.g.dart';

@freezed
class CountryCodes with _$CountryCodes {
  const factory CountryCodes({
    required String code,
    required String label,
    required String phone,
    required int phoneLength,
  }) = _CountryCodes;

  factory CountryCodes.fromJson(Map<String, dynamic> json) => _$CountryCodesFromJson(json);
}
