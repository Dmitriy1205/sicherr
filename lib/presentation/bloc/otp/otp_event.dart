part of 'otp_bloc.dart';

@freezed
class OtpEvent with _$OtpEvent {
  const factory OtpEvent.resendCode({required String phoneNumber,required void Function(String verId) verifyId}) = _ResendCode;
  const factory OtpEvent.verify({required String verificationId, required String smsCode}) = _Verify;
  const factory OtpEvent.otpSent() = _OtpSent;

  const factory OtpEvent.catchFail({required String message, required String code}) = _CatchFail;
  const factory OtpEvent.reset() = _Reset;
}
