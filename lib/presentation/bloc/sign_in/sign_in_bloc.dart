import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/core/exceptions/exceptions.dart';

import '../../../domain/repositories/auth/auth_repository.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository _authRepository;

  SignInBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const SignInState.initial()) {
    on<SignInEvent>(_mapBlocToState);
  }

  Future<void> _mapBlocToState(
          SignInEvent event, Emitter<SignInState> emit) async =>
      event.map(
        login: (e) => _login(e, emit),
        verify: (e) => _verify(e, emit),
        phoneAuthVerificationComplete: (e) =>
            emit(const SignInState.verified()),
        otpSent: (e) =>
            emit(SignInState.unVerified(verificationId: e.verificationId, phoneNumber:e.phoneNumber )),
        init: (e) => _initial(e, emit),
        resendCode: (e) => _resendCode(e, emit),
      );

  Future<void> _login(_Login event, Emitter<SignInState> emit) async {
    emit(const SignInState.loading());
    try {
      await _authRepository.loginWithPhone(
        phoneNumber: event.phoneNumber,
        verificationCompleted: (credential) async {
          add(SignInEvent.phoneAuthVerificationComplete(
              credential: credential));
        },
        verificationFailed: (exception) {},
        codeSent: (verificationId, token) {
          add(SignInEvent.otpSent(
              verificationId: verificationId, token: token, phoneNumber:event.phoneNumber ));
        },
        codeAutoRetrievalTimeout: (String) {},
      );
      // emit(const SignInState.verified());
    } on BadRequestException catch (e) {
      emit(SignInState.error(error: e.message));
    }
  }

  Future<void> _verify(_Verify event, Emitter<SignInState> emit) async {
    try {
      emit(const SignInState.verification());
      await _authRepository.verification(
          verificationId: event.verificationId, code: event.smsCode);
      emit(const SignInState.loaded());
    } on BadRequestException catch (e) {
      emit(SignInState.error(error: e.message));
    }
  }

  Future<void> _resendCode(_ResendCode event, Emitter<SignInState> emit) async {

    try {
      await _authRepository.loginWithPhone(
        phoneNumber: event.phoneNumber,
        verificationCompleted: (credential) async {},
        verificationFailed: (exception) {},
        codeSent: (verificationId, token) {
          event.verifyId(verificationId);
        },
        codeAutoRetrievalTimeout: (string) {},
      );
      emit(const SignInState.wait());
    } on BadRequestException catch (e) {
      emit(SignInState.error(error: e.message));
    }
  }

  Future<void> _initial(_Init event, Emitter<SignInState> emit) async {
    emit(const SignInState.initial());
  }
}
