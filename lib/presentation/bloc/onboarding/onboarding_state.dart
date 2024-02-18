part of 'onboarding_bloc.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const OnboardingState._();
  Onboarding? get onboarding =>
      maybeMap(loaded: (state) => state.onboarding, orElse: () => null);
  const factory OnboardingState.initial() = _Initial;
  const factory OnboardingState.loading() = _Loading;
  const factory OnboardingState.loaded({Onboarding? onboarding}) = _Loaded;
  const factory OnboardingState.error({required String error}) = _Error;
}
