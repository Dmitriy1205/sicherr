import 'package:sicherr/domain/repositories/timer/timer_repository_service.dart';

class TimerEntry{
  final DateTime date;
  final int seconds;

  const TimerEntry({
    required this.date,
    required this.seconds,
  });
}

abstract class TimerRepository{
  Future<TimerEntry?> fetchTimerDate();
}