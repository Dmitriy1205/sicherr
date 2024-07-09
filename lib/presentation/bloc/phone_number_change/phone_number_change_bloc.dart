import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../domain/repositories/auth/auth_repository.dart';

part 'phone_number_change_event.dart';

part 'phone_number_change_state.dart';

part 'phone_number_change_bloc.freezed.dart';

class PhoneNumberChangeBloc
    extends Bloc<PhoneNumberChangeEvent, PhoneNumberChangeState> {
  final AuthRepository _authRepository;

  PhoneNumberChangeBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const PhoneNumberChangeState.initial()) {
    on<PhoneNumberChangeEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(
          PhoneNumberChangeEvent event, Emitter<PhoneNumberChangeState> emit) async =>
      event.map(
          sendCode: (e) => _sendCode(e, emit),
          verify: (e) => _verify(e, emit),
          otpSent: (e) => emit(PhoneNumberChangeState.wait(
            phoneNumber: e.phoneNumber,
            verificationId: e.verificationId
          )),
          catchFail: (e) =>
              emit(PhoneNumberChangeState.error(message: e.message, code: e.code)),
          reset: (e) => _reset(e, emit));

  Future<void> _verify(_Verify event, Emitter<PhoneNumberChangeState> emit) async {
    try {
      emit(const PhoneNumberChangeState.verification());
      await _authRepository.confirmPhoneChange(
          verificationId: event.verificationId,
          code: event.smsCode,
          newPhoneNumber: event.newPhoneNumber);

      emit(const PhoneNumberChangeState.success());
    } on BadRequestException catch (e) {
      emit(PhoneNumberChangeState.error(message: e.message, code: e.code));
    }
  }

  Future<void> _reset(_Reset event, Emitter<PhoneNumberChangeState> emit) async {
    emit(const PhoneNumberChangeState.initial());
  }

  Future<void> _sendCode(
      _SendCode event, Emitter<PhoneNumberChangeState> emit) async {
    try {
      emit(const PhoneNumberChangeState.verification());
      await _authRepository.verifyPhone(
        phoneNumber: event.phoneNumber,
        verificationCompleted: (credential) async {},
        verificationFailed: (exception) {
          add(PhoneNumberChangeEvent.catchFail(
              message: exception.message!, code: exception.code));
        },
        codeSent: (verificationId, token) {
          add(PhoneNumberChangeEvent.otpSent(phoneNumber: event.phoneNumber, verificationId: verificationId));
        },
        codeAutoRetrievalTimeout: (string) {},
      );
      // emit(const PhoneNumberChangeState.wait());
    } on BadRequestException catch (e) {
      emit(PhoneNumberChangeState.error(message: e.message, code: e.code));
    }
  }
}
