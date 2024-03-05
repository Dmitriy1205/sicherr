part of 'otp_bloc.dart';

@freezed
class OtpState with _$OtpState {
  const factory OtpState.initial() = _Initial;
  const factory OtpState.wait() = _Wait;
  const factory OtpState.verification() = _Verification;
  const factory OtpState.loaded() = _Loaded;
  const factory OtpState.error({required String message, String? code}) = _Error;
}
