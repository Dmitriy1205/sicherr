import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/domain/entities/onboarding/onboarding.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../domain/repositories/user/user_repository.dart';
import '../auth/auth_bloc.dart';

part 'onboarding_event.dart';

part 'onboarding_state.dart';

part 'onboarding_bloc.freezed.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final UserRepository _userRepository;
  final AuthBloc _authBloc;

  OnboardingBloc({
    required UserRepository userRepository,
    required AuthBloc authBloc,
  })  : _userRepository = userRepository,
        _authBloc = authBloc,
        super(const OnboardingState.initial()) {
    on<OnboardingEvent>(_mapBlocToState);
  }

  Future<void> _mapBlocToState(
      OnboardingEvent event, Emitter<OnboardingState> emit) async {
    await event.map(
        create: (e) => _createTutorial(e, emit),
        update: (e) => _updateTutorial(e, emit),
        get: (e) => _getTutorial(e, emit));
  }

  Future<void> _createTutorial(
      _Create event, Emitter<OnboardingState> emit) async {
    emit(const OnboardingState.loading());
    try {
      final currentUser = _authBloc.state.user!.uid;
      await _userRepository.writeOnboarding(currentUserId: currentUser);

      emit(const OnboardingState.loaded());
    } on BadRequestException catch (e) {
      emit(OnboardingState.error(error: e.message));
    }
  }

  Future<void> _updateTutorial(
      _Update event, Emitter<OnboardingState> emit) async {
    emit(const OnboardingState.loading());
    try {
      final currentUser = _authBloc.state.user!.uid;
      await _userRepository.updateOnboarding(
          currentUserId: currentUser, data: event.data);
      final tutorial = await _userRepository.getOnboarding(currentUserId: currentUser);

      emit(OnboardingState.loaded(onboarding: tutorial));
    } on BadRequestException catch (e) {
      emit(OnboardingState.error(error: e.message));
    }
  }

  Future<void> _getTutorial(_Get event, Emitter<OnboardingState> emit) async {
    emit(const OnboardingState.loading());
    try {



      Onboarding? newOnboarding;
      final currentUser = _authBloc.state.user!.uid;
      final onboarding = await _userRepository.getOnboarding(currentUserId: currentUser);
      if (onboarding == null) {
        await _userRepository.writeOnboarding(currentUserId: currentUser);
        newOnboarding = await _userRepository.getOnboarding(currentUserId: currentUser);
      } else {
        newOnboarding = await _userRepository.getOnboarding(currentUserId: currentUser);
      }

      emit(OnboardingState.loaded(onboarding: newOnboarding));
    } on BadRequestException catch (e) {
      emit(OnboardingState.error(error: e.message));
    }
  }
}
