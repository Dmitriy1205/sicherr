import 'package:sicherr/domain/entities/tracking/tracking.dart';

abstract class LocationSharingRepository{
  Stream<List<Tracking>> usersTracking({required String userUid});
  Future<void> shareTrackingTo({required List<String> usersUid, required Tracking tracking});
  Future<void> cancelSharingTrackingTo({required List<String> usersUid});
  Future<void> cancelSharingTrackingByPhones({required List<String> usersPhones});
}