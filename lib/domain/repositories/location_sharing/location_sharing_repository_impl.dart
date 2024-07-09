import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sicherr/domain/entities/tracking/tracking.dart';
import 'package:sicherr/domain/repositories/location_sharing/location_sharing_repository_contract.dart';

int _pushCooldownInSeconds = 5;

class LocationSharingRepositoryImpl implements LocationSharingRepository {
  final FirebaseFirestore _db;

  bool _canPushTracking = true;

  void _updatePushTrackingTime() {
    _canPushTracking = false;
    Future.delayed(Duration(seconds: _pushCooldownInSeconds), () {
      _canPushTracking = true;
    });
  }

  @override
  Future<void> cancelSharingTrackingTo({required List<String> usersUid}) async {
    if (usersUid.isEmpty) return;
    final batch = _db.batch();
    for (var userUid in usersUid) {
      final trackingRef = _db
          .collection('users')
          .doc(userUid)
          .collection('tracking')
          .doc(userUid);
      batch.delete(trackingRef);
    }
    await batch.commit();
  }

  @override
  Future<void> cancelSharingTrackingByPhones(
      {required List<String> usersPhones}) async {
    if (usersPhones.isEmpty) return;
    List<String> usersUid = [];
    for (var userPhone in usersPhones) {
      final foundUsersByPhone = await _db
          .collection('users')
          .where('phone', isEqualTo: userPhone)
          .get();
      if (foundUsersByPhone.size == 0) continue;
      usersUid.add(foundUsersByPhone.docs.first.id);
    }
    return cancelSharingTrackingTo(usersUid: usersUid);
  }

  @override
  Future<void> shareTrackingTo(
      {required List<String> usersUid, required Tracking tracking}) async {
    if (!_canPushTracking || usersUid.isEmpty) return;
    _updatePushTrackingTime();
    final batch = _db.batch();
    for (var userUid in usersUid) {
      final trackingRef = _db
          .collection('users')
          .doc(userUid)
          .collection('tracking')
          .doc(userUid);
      batch.set(trackingRef,
          {...tracking.toJson(), "lastUpdated": FieldValue.serverTimestamp()});
    }
    await batch.commit();
  }

  @override
  Stream<List<Tracking>> usersTracking({required String userUid}) {
    return _db
        .collection('users')
        .doc(userUid)
        .collection('tracking')
        .snapshots()
        .map((event) =>
            event.docs.map((e) => Tracking.fromJson(e.data())).toList());
  }

  LocationSharingRepositoryImpl({
    required FirebaseFirestore db,
  }) : _db = db;
}
