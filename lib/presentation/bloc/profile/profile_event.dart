part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.setProfileFields({required String currentUserId}) = _SetProfileFields;
  const factory ProfileEvent.getProfileFields() = _GetProfileFields;
  const factory ProfileEvent.updateSpecificProfileField({required Map<String, dynamic> data}) = _UpdateSpecificProfileField;

  const factory ProfileEvent.loadProfileFields({required UserProfile profileFields}) = _LoadProfileFields;
  const factory ProfileEvent.catchError({required String error}) = _CatchError;
}
