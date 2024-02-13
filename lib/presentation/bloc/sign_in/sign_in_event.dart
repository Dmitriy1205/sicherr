part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.init() = _Init;
  const factory SignInEvent.login({required String phoneNumber,required void Function(String verId) verifyId}) = _Login;
  const factory SignInEvent.resendCode({required String phoneNumber,required void Function(String verId) verifyId}) = _ResendCode;
  const factory SignInEvent.verify({required String verificationId, required String smsCode}) = _Verify;
  const factory SignInEvent.phoneAuthVerificationComplete({required AuthCredential credential}) = _PhoneAuthVerificationComplete;
  const factory SignInEvent.otpSent({required String verificationId, required int? token,required String phoneNumber}) = _OtpSent;
}
