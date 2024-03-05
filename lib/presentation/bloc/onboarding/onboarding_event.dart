part of 'onboarding_bloc.dart';

@freezed
class OnboardingEvent with _$OnboardingEvent {
  const factory OnboardingEvent.create() = _Create;
  const factory OnboardingEvent.update({required Map<String,dynamic> data}) = _Update;
  const factory OnboardingEvent.get() = _Get;
}
