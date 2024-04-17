part of 'contact_details_bloc.dart';

@freezed
class ContactDetailsState with _$ContactDetailsState {
  const factory ContactDetailsState.initial() = _Initial;
  const factory ContactDetailsState.loadInProgress() = _LoadInProgress;
  const factory ContactDetailsState.loaded({required ContactEntity detailedContact, required bool showEmrBtn, required double ratingByUser}) = _Loaded;
  const factory ContactDetailsState.successAddedTag() = _SuccessAddedTag;
}