part of 'phone_number_change_bloc.dart';

@freezed
class PhoneNumberChangeEvent with _$PhoneNumberChangeEvent {
  const factory PhoneNumberChangeEvent.sendCode({required String phoneNumber}) = _SendCode;
  const factory PhoneNumberChangeEvent.verify({required String verificationId, required String smsCode, required String newPhoneNumber}) = _Verify;
  const factory PhoneNumberChangeEvent.otpSent({required String phoneNumber, required String verificationId}) = _OtpSent;

  const factory PhoneNumberChangeEvent.catchFail({required String message, required String code}) = _CatchFail;
  const factory PhoneNumberChangeEvent.reset() = _Reset;
}
