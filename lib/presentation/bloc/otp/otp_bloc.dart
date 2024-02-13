import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../domain/repositories/auth/auth_repository.dart';

part 'otp_event.dart';

part 'otp_state.dart';

part 'otp_bloc.freezed.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final AuthRepository _authRepository;

  OtpBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const OtpState.initial()) {
    on<OtpEvent>(_mapBlocToState);
  }

  Future<void> _mapBlocToState(OtpEvent event, Emitter<OtpState> emit) async =>
      event.map(
        verify: (e) => _verify(e, emit),
        resendCode: (e) => _resendCode(e, emit),
        catchFail: (e) => emit(OtpState.error(error: e.exception)),
        reset: (e) => _reset(e, emit),
      );

  Future<void> _verify(_Verify event, Emitter<OtpState> emit) async {
    try {
      emit(const OtpState.verification());
      await _authRepository.verification(
          verificationId: event.verificationId, code: event.smsCode);
      emit(const OtpState.loaded());
    } on BadRequestException catch (e) {
      emit(OtpState.error(error: e.message));
    }
  }

  Future<void> _resendCode(_ResendCode event, Emitter<OtpState> emit) async {
    try {
      await _authRepository.loginWithPhone(
        phoneNumber: event.phoneNumber,
        verificationCompleted: (credential) async {},
        verificationFailed: (exception) {
          add(OtpEvent.catchFail(exception: exception.message!));
        },
        codeSent: (verificationId, token) {
          event.verifyId(verificationId);
        },
        codeAutoRetrievalTimeout: (string) {},
      );
      emit(const OtpState.wait());
    } on BadRequestException catch (e) {
      emit(OtpState.error(error: e.message));
    }
  }

  Future<void> _reset(_Reset event, Emitter<OtpState> emit) async {
    emit(const OtpState.initial());
  }
}
