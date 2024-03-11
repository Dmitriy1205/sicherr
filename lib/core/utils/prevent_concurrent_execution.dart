import 'dart:async';

class PreventConcurrentExecution {
  static bool _isRunning = false;

  static void execute(void Function() method,
      {Duration delay = const Duration(milliseconds: 100)}) {
    if (!_isRunning) {
      method.call();
    }
    _isRunning = true;
    Timer(delay, () => _isRunning = false);
  }
}
