import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding.freezed.dart';

part 'onboarding.g.dart';

@freezed
class Onboarding with _$Onboarding {
  const factory Onboarding({
    bool? isWelcome,
  }) = _Onboarding;

  factory Onboarding.fromJson(Map<String, dynamic> json) =>
      _$OnboardingFromJson(json);
}
