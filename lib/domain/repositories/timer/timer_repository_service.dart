import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sicherr/domain/repositories/timer/timer_repository_contract.dart';

class TimerRepositoryImpl implements TimerRepository{
  final FirebaseFirestore _db;
  @override
  Future<TimerEntry?> fetchTimerDate() async{
    final snapshot = await _db.collection('timers').get();
    if(snapshot.docs.isEmpty) return null;
    final data = snapshot.docs.first.data();
    return TimerEntry(
        seconds: data['seconds'],
        date: (data['executionDate'] as Timestamp).toDate());
  }

  const TimerRepositoryImpl({
    required FirebaseFirestore db,
  }) : _db = db;
}