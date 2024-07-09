part of 'phone_number_change_bloc.dart';

@freezed
class PhoneNumberChangeState with _$PhoneNumberChangeState {
  const factory PhoneNumberChangeState.initial() = _Initial;
  const factory PhoneNumberChangeState.wait({required String phoneNumber, required String verificationId}) = _Wait;
  const factory PhoneNumberChangeState.verification() = _Verification;
  const factory PhoneNumberChangeState.success() = _Success;
  const factory PhoneNumberChangeState.error({required String message, String? code}) = _Error;
}
